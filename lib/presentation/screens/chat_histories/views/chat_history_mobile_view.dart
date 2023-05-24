import 'package:auto_route/auto_route.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/routes/router.gr.dart';
import 'package:tradix/business_logic/cubit/chat_history/chat_history_cubit.dart';
import 'package:tradix/business_logic/cubit/history_message/history_message_cubit.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/history.dart';

class ChatHistoryMobileView extends StatelessWidget {
  const ChatHistoryMobileView({super.key});

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        color: Colors.black,
        icon: const Icon(Icons.west),
        onPressed: () {
          AutoRouter.of(context).pop();
        },
      ),
      title: const Text(
        "Histories",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Agne',
          fontSize: 25,
          letterSpacing: 1.2,
        ),
      ),
      centerTitle: true,
    );
  }

  List<Widget> buildHistories({
    required Map<String, List<OpenAIChatCompletionChoiceMessageModel>> historyData,
  }) {
    List<Widget> items = [];

    var chatHistories = historyData.entries.toList();
    chatHistories.sort((a, b) => b.key.compareTo(a.key));

    for (var chatHistory in chatHistories) {
      items.add(
        Builder(
          builder: (BuildContext context) {
            final historyMessageCubit = BlocProvider.of<HistoryMessageCubit>(context);

            return GestureDetector(
              onTap: () {
                historyMessageCubit.pushMany(chatHistory.value);
                AutoRouter.of(context).pushNamed(ChatRoute.name.path);
              },
              child: History(
                firstMessage: chatHistory.value.last.content,
                secondMessage: chatHistory.value.last.content,
                // secondMessage: chatHistory.value[chatHistories.length - 2].content,
                historyDateTime: chatHistory.key,
              ),
            );
          },
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        physics: const ScrollPhysics(),
        child: BlocBuilder<ChatHistoryCubit, ChatHistoryState>(
          builder: (context, state) {
            return Column(
              children: [
                ...buildHistories(historyData: state.historyData),
              ],
            );
          },
        ),
      ),
    );
  }
}
