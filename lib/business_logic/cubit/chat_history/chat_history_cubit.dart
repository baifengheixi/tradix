import 'package:dart_openai/dart_openai.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tradix/business_logic/cubit/history_message/history_message_cubit.dart';

part 'chat_history_state.dart';

class ChatHistoryCubit extends HydratedCubit<ChatHistoryState> {
  ChatHistoryCubit() : super(ChatHistoryInitial());

  update(HistoryMessageState historyMessageState) {
    var historyData = {...state.historyData};

    if (historyData[historyMessageState.prevDateTime] != null) {
      historyData.remove(historyMessageState.prevDateTime);
    }
    historyData[historyMessageState.dateTime] = historyMessageState.histories;

    emit(ChatHistoryUpdate(historyData: historyData));
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
