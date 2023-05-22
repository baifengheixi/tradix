part of 'history_message_cubit.dart';

@immutable
abstract class HistoryMessageState {
  final List<OpenAIChatCompletionChoiceMessageModel> histories;

  const HistoryMessageState({
    this.histories = const [],
  });
}

class HistoryMessageInitial extends HistoryMessageState {}

class HistoryMessageUpdate extends HistoryMessageState {
  const HistoryMessageUpdate({
    required histories,
  }) : super(
          histories: histories,
        );
}
