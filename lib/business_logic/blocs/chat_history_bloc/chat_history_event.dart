part of 'chat_history_bloc.dart';

@immutable
abstract class ChatHistoryEvent {}

class ChatHistoryUpdateEvent extends ChatHistoryEvent {}
