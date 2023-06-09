import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/routes/router.gr.dart';
import 'package:tradix/business_logic/cubit/chat_history/chat_history_cubit.dart';
import 'package:tradix/business_logic/cubit/history_message/history_message_cubit.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/history.dart';

class HistorySlider extends StatelessWidget {
  const HistorySlider({super.key});

  List<Widget> buildHistories({
    required Map<String, List<OpenAIChatCompletionChoiceMessageModel>> historyData,
  }) {
    List<Widget> items = [];

    var chatHistories = historyData.entries.toList();
    chatHistories.sort((a, b) => b.key.compareTo(a.key));

    var count = 1;
    for (var chatHistory in chatHistories) {
      if (count > 5) break;
      items.add(
        Builder(
          builder: (BuildContext context) {
            final historyMessageCubit = BlocProvider.of<HistoryMessageCubit>(context);

            return GestureDetector(
              onTap: () {
                historyMessageCubit.pushOldHistory(chatHistory.key, chatHistory.value);
                AutoRouter.of(context).pushNamed(ChatRoute.name.path);
              },
              child: History(
                firstMessage: chatHistory.value[chatHistory.value.length - 2].content,
                secondMessage: chatHistory.value.last.content,
                historyDateTime: chatHistory.key,
              ),
            );
          },
        ),
      );
      count++;
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatHistoryCubit, ChatHistoryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 170,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              padEnds: false,
            ),
            items: buildHistories(historyData: state.historyData),
          ),
        );
      },
    );
  }
}
