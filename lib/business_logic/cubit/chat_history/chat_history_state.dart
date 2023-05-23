part of 'chat_history_cubit.dart';

@immutable
class ChatHistoryState {
  final Map<String, List<OpenAIChatCompletionChoiceMessageModel>> historyData;

  const ChatHistoryState({
    this.historyData = const {},
  });

  Map<String, dynamic> toMap() {
    var historyDataMap = {};

    for (var key in historyData.keys) {
      historyDataMap[key] = historyData[key]!.map((e) => e.toMap()).toList();
    }

    return {
      'historyData': historyDataMap,
    };
  }

  factory ChatHistoryState.fromMap(Map<String, dynamic> map) {
    var historyData = map['historyData'];

    for (var key in historyData.keys) {
      historyData[key] = List<OpenAIChatCompletionChoiceMessageModel>.from(
        map['historyData'][key]?.map((x) => OpenAIChatCompletionChoiceMessageModel.fromMap(x)),
      );
    }

    return ChatHistoryState(
      historyData: Map<String, List<OpenAIChatCompletionChoiceMessageModel>>.from(historyData),
    );
  }
}

class ChatHistoryInitial extends ChatHistoryState {}

class ChatHistoryUpdate extends ChatHistoryState {
  const ChatHistoryUpdate({
    required Map<String, List<OpenAIChatCompletionChoiceMessageModel>> historyData,
  }) : super(
          historyData: historyData,
        );
}
