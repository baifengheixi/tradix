import 'package:dart_openai/openai.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_history_state.dart';

class ChatHistoryCubit extends HydratedCubit<ChatHistoryState> {
  ChatHistoryCubit() : super(ChatHistoryInitial());

  push({
    required List<OpenAIChatCompletionChoiceMessageModel> histories,
  }) {
    emit(
      ChatHistoryUpdate(
        historyData: {
          ...state.historyData,
          DateTime.now().toIso8601String(): histories,
        },
      ),
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
