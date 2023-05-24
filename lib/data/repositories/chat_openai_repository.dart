import 'package:dart_openai/dart_openai.dart';
import 'package:injectable/injectable.dart';

abstract class COAIR {
  Future<OpenAIChatCompletionModel> chat({
    required List<OpenAIChatCompletionChoiceMessageModel> messages,
  });
  Stream<OpenAIStreamChatCompletionModel> chatStream({
    required List<OpenAIChatCompletionChoiceMessageModel> messages,
  });
}

@Injectable()
class ChatOpenAIRepository implements COAIR {
  @override
  Future<OpenAIChatCompletionModel> chat({
    required List<OpenAIChatCompletionChoiceMessageModel> messages,
  }) async {
    OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: messages,
    );
    return chatCompletion;
  }

  @override
  Stream<OpenAIStreamChatCompletionModel> chatStream({
    required List<OpenAIChatCompletionChoiceMessageModel> messages,
  }) {
    Stream<OpenAIStreamChatCompletionModel> chatStream = OpenAI.instance.chat.createStream(
      model: "gpt-3.5-turbo",
      messages: messages,
    );

    return chatStream;
  }
}
