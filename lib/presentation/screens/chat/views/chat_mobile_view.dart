import 'package:auto_route/auto_route.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/business_logic/cubit/system_message/system_message_cubit.dart';
import 'package:tradix/presentation/screens/chat/bloc/ai_message/ai_message_bloc.dart';
import 'package:tradix/presentation/screens/chat/cubit/history_message/history_message_cubit.dart';
import 'package:tradix/presentation/screens/chat/cubit/user_message/user_message_cubit.dart';

class ChatMobileView extends StatelessWidget {
  const ChatMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userMessageCubit = BlocProvider.of<UserMessageCubit>(context);
    var historyMessageCubit = BlocProvider.of<HistoryMessageCubit>(context);
    var aiMessageBloc = BlocProvider.of<AIMessageBloc>(context);
    var systemMessageCubit = BlocProvider.of<SystemMessageCubit>(context);

    Widget welcomeText() {
      return ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 10.screenWidth,
            maxHeight: 10.screenWidth,
          ),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: Text("Hi! How can I help you"),
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
            if (systemMessageCubit.state.message.isNotEmpty) {
              systemMessageCubit.clear();
              return true;
            }
            if (userMessageCubit.state.message.isNotEmpty) {
              userMessageCubit.clear();
              return true;
            }
            return false;
          },
          listener: (context, state) {
            aiMessageBloc.add(AIMessageFetchEvent(history: historyMessageCubit.state.history));
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.west),
            onPressed: () {
              systemMessageCubit.clear();
              AutoRouter.of(context).pop();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 15.screenHeight),
          physics: const ScrollPhysics(),
          reverse: true,
          child: Column(
            children: [
              welcomeText(),
              BlocBuilder<HistoryMessageCubit, HistoryMessageState>(
                builder: (context, state) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.history.length,
                    itemBuilder: (context, index) {
                      var message = historyMessageCubit.state.history[index].content;

                      return ListTile(
                        onLongPress: () {
                          Clipboard.setData(ClipboardData(text: message));
                        },
                        leading: index % 2 != 0
                            ? ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 10.screenWidth,
                                  maxHeight: 10.screenWidth,
                                ),
                                child: Image.asset('assets/images/logo.png'),
                              )
                            : Icon(
                                Icons.account_circle,
                                size: 8.screenWidth,
                              ),
                        title: Text(message),
                        // title: MarkdownBody(
                        //   data: historyMessageCubit.state.history[index].content,
                        //   extensionSet: md.ExtensionSet(
                        //     md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                        //     [md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
                        //   ),
                        // ),
                      );
                    },
                  );
                },
              ),
              BlocBuilder<AIMessageBloc, AIMessageState>(
                builder: (context, state) {
                  if (state.isCompleted || state.message.isEmpty) {
                    return Container();
                  }
                  return ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      size: 8.screenWidth,
                    ),
                    title: Text(aiMessageBloc.state.message),
                    // title: MarkdownBody(
                    //   data: aiMessageBloc.state.message,
                    //   extensionSet: md.ExtensionSet(
                    //     md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                    //     [md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
                    //   ),
                    // ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomSheet: Container(
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
                child: BlocBuilder<SystemMessageCubit, SystemMessageState>(
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
                        if (state.message.isEmpty) {
                          userMessageCubit.update(value);
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: 2.screenWidth),
              GestureDetector(
                onTap: () {
                  if (userMessageCubit.state.message.isEmpty && systemMessageCubit.state.message.isEmpty) {
                    return;
                  }
                  if (systemMessageCubit.state.message.isNotEmpty) {
                    historyMessageCubit.push(systemMessageCubit.state.message, OpenAIChatMessageRole.system);
                  } else {
                    historyMessageCubit.push(userMessageCubit.state.message, OpenAIChatMessageRole.user);
                  }
                },
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
