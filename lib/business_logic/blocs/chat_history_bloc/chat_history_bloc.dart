import 'package:bloc/bloc.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:meta/meta.dart';

part 'chat_history_event.dart';
part 'chat_history_state.dart';

class ChatHistoryBloc extends Bloc<ChatHistoryEvent, ChatHistoryState> {
  ChatHistoryBloc() : super(ChatHistoryInitial()) {
    on<ChatHistoryUpdateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
