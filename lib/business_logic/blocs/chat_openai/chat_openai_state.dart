part of 'chat_openai_bloc.dart';

@immutable
abstract class ChatOpenAIState {
  final OpenAIChatCompletionModel? openai;
  final String? errorMessage;
  final int? statusCode;
  final bool isLoading;

  const ChatOpenAIState({
    this.openai,
    this.errorMessage,
    this.statusCode,
    this.isLoading = false,
  });
}

class ChatOpenAIInitial extends ChatOpenAIState {}

class ChatOpenAILoading extends ChatOpenAIState {
  const ChatOpenAILoading() : super(isLoading: true);
}

class ChatOpenAILoaded extends ChatOpenAIState {
  const ChatOpenAILoaded({required OpenAIChatCompletionModel openai}) : super(openai: openai, isLoading: false);
}

class ChatOpenAIError extends ChatOpenAIState {
  const ChatOpenAIError({
    required String? errorMessage,
    required int? statusCode,
  }) : super(
          errorMessage: errorMessage,
          isLoading: false,
          statusCode: statusCode,
        );
}
