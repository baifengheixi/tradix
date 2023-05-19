part of 'system_message_cubit.dart';

@immutable
abstract class SystemMessageState {
  final String message;

  const SystemMessageState({
    this.message = '',
  });
}

class SystemMessageInitial extends SystemMessageState {}

class SystemMessageUpdate extends SystemMessageState {
  const SystemMessageUpdate({
    required message,
  }) : super(
          message: message,
        );
}
