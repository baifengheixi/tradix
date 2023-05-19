import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
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

    init() {
      historyMessageCubit.push(systemMessageCubit.state.message, OpenAIChatMessageRole.system);
      systemMessageCubit.clear();
      aiMessageBloc.add(AIMessageFetchEvent(history: historyMessageCubit.state.history));
    }

    init();

    return BlocListener<AIMessageBloc, AIMessageState>(
      listener: (context, state) {
        if (state.isCompleted) {
          historyMessageCubit.push(aiMessageBloc.state.message, OpenAIChatMessageRole.assistant);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HistoryMessageCubit, HistoryMessageState>(
          builder: (context, state) {
            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: historyMessageCubit.state.history.length,
                  itemBuilder: (BuildContext context, int index) {
                    var history = historyMessageCubit.state.history[index];

                    return ListTile(
                      leading: index % 2 == 0 ? const Icon(Icons.add) : const Icon(Icons.remove),
                      subtitle: MarkdownBody(
                        data: history.content,
                        extensionSet: md.ExtensionSet(
                          md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                          [md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
        bottomSheet: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(5.screenWidth),
          height: 10.screenHeight,
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a message',
                  ),
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    userMessageCubit.update(value);
                  },
                ),
              ),
              SizedBox(width: 2.screenWidth),
              GestureDetector(
                onTap: () {
                  historyMessageCubit.push(userMessageCubit.state.message, OpenAIChatMessageRole.user);
                  userMessageCubit.clear();
                  aiMessageBloc.add(AIMessageFetchEvent(history: historyMessageCubit.state.history));
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
