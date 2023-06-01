import 'package:bloc/bloc.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'history_message_state.dart';

@injectable
class HistoryMessageCubit extends Cubit<HistoryMessageState> {
  HistoryMessageCubit() : super(HistoryMessageInitial());

  push(String message, OpenAIChatMessageRole role) {
    var lastMessage = OpenAIChatCompletionChoiceMessageModel(
      role: role,
      content: message,
    );

    emit(
      HistoryMessageUpdate(
        histories: [...state.histories, lastMessage],
        prevDateTime: state.dateTime,
        dateTime: DateTime.now(),
      ),
    );
  }

  pushOldHistory(String dateTime, List<OpenAIChatCompletionChoiceMessageModel> histories) {
    emit(
      HistoryMessageUpdate(
        histories: histories,
        prevDateTime: dateTime,
        dateTime: DateTime.parse(dateTime),
      ),
    );
  }

  clear() {
    emit(HistoryMessageInitial());
  }
}
