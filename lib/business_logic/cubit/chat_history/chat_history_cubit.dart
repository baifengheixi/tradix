import 'package:dart_openai/openai.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_history_state.dart';

class ChatHistoryCubit extends Cubit<ChatHistoryState> with HydratedMixin {
  ChatHistoryCubit() : super(ChatHistoryInitial());

  push(List<OpenAIChatCompletionChoiceMessageModel> history) {
    emit(
      ChatHistoryUpdate(histories: [...state.histories, history]),
    );
  }

  @override
  ChatHistoryState? fromJson(Map<String, dynamic> json) {
    return ChatHistoryState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ChatHistoryState state) {
    return state.toMap();
  }
}
