import 'package:auto_route/auto_route.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/business_logic/cubit/chat_history/chat_history_cubit.dart';
import 'package:tradix/business_logic/cubit/system_message/system_message_cubit.dart';
import 'package:tradix/business_logic/cubit/user_message/user_message_cubit.dart';
import 'package:tradix/presentation/screens/chat/bloc/ai_message/ai_message_bloc.dart';
import 'package:tradix/presentation/screens/chat/cubit/history_message/history_message_cubit.dart';
import 'package:tradix/presentation/screens/chat/widget/chat_list_tile.dart';

class ChatMobileView extends StatelessWidget {
  const ChatMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final userMessageCubit = BlocProvider.of<UserMessageCubit>(context);
    final historyMessageCubit = BlocProvider.of<HistoryMessageCubit>(context);
    final aiMessageBloc = BlocProvider.of<AIMessageBloc>(context);
    final systemMessageCubit = BlocProvider.of<SystemMessageCubit>(context);
    final chatHistoryCubit = BlocProvider.of<ChatHistoryCubit>(context);

    if (systemMessageCubit.state.message.isNotEmpty) {
      historyMessageCubit.push(systemMessageCubit.state.message, OpenAIChatMessageRole.system);
      systemMessageCubit.clear();
    }
    if (userMessageCubit.state.message.isNotEmpty) {
      historyMessageCubit.push(userMessageCubit.state.message, OpenAIChatMessageRole.user);
      userMessageCubit.clear();
      aiMessageBloc.add(AIMessageFetchEvent(history: historyMessageCubit.state.histories));
    }

    AppBar appBar() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.west),
          onPressed: () {
            userMessageCubit.clear();
            chatHistoryCubit.push(histories: historyMessageCubit.state.histories);
            AutoRouter.of(context).pop();
          },
        ),
      );
    }

    Widget body() {
      return SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 12.screenHeight),
        physics: const ScrollPhysics(),
        reverse: true,
        child: Column(
          children: [
            historyMessageCubit.state.histories.first.role == OpenAIChatMessageRole.system
                ? ChatListTile(isUserMessage: false, message: "Hi! How can I help you?")
                : Container(),
            BlocBuilder<HistoryMessageCubit, HistoryMessageState>(
              builder: (context, state) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.histories.length,
                  itemBuilder: (context, index) {
                    var history = historyMessageCubit.state.histories[index];
                    if (history.role == OpenAIChatMessageRole.system) {
                      return Container();
                    }

                    if (history.role == OpenAIChatMessageRole.user) {
                      return ChatListTile(isUserMessage: true, message: history.content);
                    }
                    return ChatListTile(isUserMessage: false, message: history.content);
                  },
                );
              },
            ),
            BlocBuilder<AIMessageBloc, AIMessageState>(
              builder: (context, state) {
                if (state.isCompleted || state.message.isEmpty) {
                  return Container();
                }
                return ChatListTile(isUserMessage: false, message: state.message);
              },
            ),
          ],
        ),
      );
    }

    Widget bottomSheet() {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade300),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(5.screenWidth),
        child: Row(
          children: [
            Flexible(
              child: BlocBuilder<UserMessageCubit, UserMessageState>(
                buildWhen: (_, state) {
                  return state.isSubmitted;
                },
                builder: (context, state) {
                  return TextField(
                    maxLines: null,
                    controller: TextEditingController(text: state.message),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a message',
                    ),
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      userMessageCubit.update(value);
                    },
                  );
                },
              ),
            ),
            SizedBox(width: 2.screenWidth),
            IconButton(
              color: Colors.black,
              icon: const Icon(Icons.send),
              onPressed: () {
                // if (historyMessageCubit.state.history.isNotEmpty && !aiMessageBloc.state.isCompleted) {
                //   return;
                // }
                if (userMessageCubit.state.message.isEmpty) {
                  return;
                }
                historyMessageCubit.push(userMessageCubit.state.message, OpenAIChatMessageRole.user);
              },
            ),
          ],
        ),
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<AIMessageBloc, AIMessageState>(
          listener: (context, state) {
            if (state.isCompleted) {
              historyMessageCubit.push(aiMessageBloc.state.message, OpenAIChatMessageRole.assistant);
            }
          },
        ),
        BlocListener<HistoryMessageCubit, HistoryMessageState>(
          listenWhen: (previous, current) {
            if (historyMessageCubit.isClosed) {
              return true;
            }
            if (userMessageCubit.state.message.isNotEmpty) {
              userMessageCubit.clear();
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (context.read<HistoryMessageCubit>().isClosed) {
              print('history bloc is close');
            }
            aiMessageBloc.add(AIMessageFetchEvent(history: historyMessageCubit.state.histories));
          },
        ),
      ],
      child: Scaffold(
        appBar: appBar(),
        body: body(),
        bottomSheet: bottomSheet(),
      ),
    );
  }
}
