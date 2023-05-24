part of 'history_message_cubit.dart';

@immutable
abstract class HistoryMessageState {
  final List<OpenAIChatCompletionChoiceMessageModel> histories;
  final String prevDateTime;
  final String dateTime;

  const HistoryMessageState({
    this.histories = const [],
    required this.prevDateTime,
    required this.dateTime,
  });
}

class HistoryMessageInitial extends HistoryMessageState {
  HistoryMessageInitial()
      : super(
          dateTime: DateTime.now().toIso8601String(),
          prevDateTime: DateTime.now().toIso8601String(),
        );
}

class HistoryMessageUpdate extends HistoryMessageState {
  HistoryMessageUpdate({
    required List<OpenAIChatCompletionChoiceMessageModel> histories,
    required String prevDateTime,
    required DateTime dateTime,
  }) : super(
          histories: histories,
          prevDateTime: prevDateTime,
          dateTime: dateTime.toIso8601String(),
        );
}
