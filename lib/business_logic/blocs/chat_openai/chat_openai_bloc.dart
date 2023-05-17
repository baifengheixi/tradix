import 'package:bloc/bloc.dart';
import 'package:dart_openai/openai.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'chat_openai_event.dart';
part 'chat_openai_state.dart';

@injectable
class ChatOpenAIBloc extends Bloc<ChatOpenAIEvent, ChatOpenAIState> {
  ChatOpenAIBloc() : super(ChatOpenAIInitial()) {
    on<ChatOpenAIFetchEvent>((event, emit) async {
      emit(const ChatOpenAILoading());
      OpenAI.apiKey = 'Your API Key';

      try {
        OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
          model: "gpt-3.5-turbo",
          messages: [
            const OpenAIChatCompletionChoiceMessageModel(
              content: "hello, what is Flutter and Dart ?",
              role: OpenAIChatMessageRole.user,
            ),
          ],
        );
        print(chatCompletion.choices.first.message.content);
        emit(ChatOpenAILoaded(openai: chatCompletion));
      } on RequestFailedException catch (e) {
        emit(ChatOpenAIError(errorMessage: e.message, statusCode: e.statusCode));
      }
    });
  }
}
