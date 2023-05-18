part of 'ai_message_bloc.dart';

@immutable
abstract class AIMessageState {
  final bool isCompleted;
  final String? errorMessage;
  final String message;

  const AIMessageState({
    this.message = '',
    this.errorMessage,
    this.isCompleted = false,
  });
}

class AIMessageInitial extends AIMessageState {}

class AIMessageLoading extends AIMessageState {}

class AIMessageLoaded extends AIMessageState {
  const AIMessageLoaded({
    required String message,
    bool? isCompleted,
  }) : super(
          message: message,
          isCompleted: isCompleted ?? false,
        );
}

class AIMessageError extends AIMessageState {
  const AIMessageError({
    required String? errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );
}
