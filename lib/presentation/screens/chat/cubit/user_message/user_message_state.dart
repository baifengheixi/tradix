part of 'user_message_cubit.dart';

@immutable
abstract class UserMessageState {
  final String message;

  const UserMessageState({
    this.message = '',
  });
}

class UserMessageInitial extends UserMessageState {}

class UserMessageUpdate extends UserMessageState {
  const UserMessageUpdate({
    required message,
  }) : super(
          message: message,
        );
}
