part of 'chat_history_cubit.dart';

@immutable
class ChatHistoryState {
  final List<OpenAIChatCompletionChoiceMessageModel> histories;

  const ChatHistoryState({
    this.histories = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'histories': histories,
    };
  }

  factory ChatHistoryState.fromMap(Map<String, dynamic> map) {
    return ChatHistoryState(
      histories: map['histories'] as List<OpenAIChatCompletionChoiceMessageModel>,
    );
  }
}

class ChatHistoryInitial extends ChatHistoryState {}

class ChatHistoryUpdate extends ChatHistoryState {
  const ChatHistoryUpdate({
    required histories,
  }) : super(
          histories: histories,
        );
}
