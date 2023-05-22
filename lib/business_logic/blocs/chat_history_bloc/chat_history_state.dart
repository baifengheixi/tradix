part of 'chat_history_bloc.dart';

@immutable
abstract class ChatHistoryState {
  final List<OpenAIChatCompletionChoiceMessageModel> histories;

  const ChatHistoryState({
    this.histories = const [],
  });
}

class ChatHistoryInitial extends ChatHistoryState {}

class ChatHistoryUpdate extends ChatHistoryState {
  const ChatHistoryUpdate({
    required histories,
  }) : super(
          histories: histories,
        );
}
