part of 'history_message_cubit.dart';

@immutable
abstract class HistoryMessageState {
  final List<OpenAIChatCompletionChoiceMessageModel> history;

  const HistoryMessageState({
    this.history = const [],
  });
}

class HistoryMessageInitial extends HistoryMessageState {}

class HistoryMessageUpdate extends HistoryMessageState {
  const HistoryMessageUpdate({
    required history,
  }) : super(
          history: history,
        );
}
