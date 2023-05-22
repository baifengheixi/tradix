part of 'system_message_cubit.dart';

@immutable
abstract class SystemMessageState {
  final String message;
  final bool isSubmitted;

  const SystemMessageState({
    this.message = '',
    this.isSubmitted = false,
  });
}

class SystemMessageInitial extends SystemMessageState {}

class SystemMessageUpdate extends SystemMessageState {
  const SystemMessageUpdate({
    required message,
    required isSubmitted,
  }) : super(
          message: message,
          isSubmitted: isSubmitted,
        );
}
