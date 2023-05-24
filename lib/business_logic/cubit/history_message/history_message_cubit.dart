import 'package:bloc/bloc.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'history_message_state.dart';

@injectable
class HistoryMessageCubit extends Cubit<HistoryMessageState> {
  HistoryMessageCubit() : super(HistoryMessageInitial());

  push(String message, OpenAIChatMessageRole role) {
    print("=========");
    print("push");
    var lastMessage = OpenAIChatCompletionChoiceMessageModel(
      role: role,
      content: message,
    );

    emit(
      HistoryMessageUpdate(
        histories: [...state.histories, lastMessage],
        prevDateTime: state.prevDateTime,
        dateTime: DateTime.now(),
      ),
    );
  }

  pushMany(List<OpenAIChatCompletionChoiceMessageModel> histories) {
    print("=========");
    print("push many");
    emit(
      HistoryMessageUpdate(
        histories: [...state.histories, ...histories],
        prevDateTime: state.dateTime,
        dateTime: DateTime.parse(state.dateTime),
      ),
    );
  }

  clear() {
    emit(HistoryMessageInitial());
  }
}
