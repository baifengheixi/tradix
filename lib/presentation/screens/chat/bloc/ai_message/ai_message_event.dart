part of 'ai_message_bloc.dart';

@immutable
abstract class AIMessageEvent {
  final List<OpenAIChatCompletionChoiceMessageModel> history;

  const AIMessageEvent({
    required this.history,
  });
}

class AIMessageFetchEvent extends AIMessageEvent {
  const AIMessageFetchEvent({
    required List<OpenAIChatCompletionChoiceMessageModel> history,
  }) : super(
          history: history,
        );
}
