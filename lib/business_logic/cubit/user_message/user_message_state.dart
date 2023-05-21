part of 'user_message_cubit.dart';

@immutable
abstract class UserMessageState {
  final String message;
  final bool isSubmitted;

  const UserMessageState({
    this.message = '',
    this.isSubmitted = false,
  });
}

class UserMessageInitial extends UserMessageState {}

class UserMessageUpdate extends UserMessageState {
  const UserMessageUpdate({
    required message,
    required isSubmitted,
  }) : super(
          message: message,
          isSubmitted: isSubmitted,
        );
}
