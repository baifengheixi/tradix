import 'package:bloc/bloc.dart';
import 'package:dart_openai/openai.dart';
import 'package:meta/meta.dart';

part 'history_message_state.dart';

class HistoryMessageCubit extends Cubit<HistoryMessageState> {
  HistoryMessageCubit() : super(HistoryMessageInitial());

  push(String message, OpenAIChatMessageRole role) {
    var lastChat = OpenAIChatCompletionChoiceMessageModel(
      role: role,
      content: message,
    );

    emit(HistoryMessageUpdate(history: [...state.history, lastChat]));
  }
}
