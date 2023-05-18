import 'package:bloc/bloc.dart';
import 'package:dart_openai/openai.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:tradix/data/repositories/chat_openai_repository.dart';

part 'chat_openai_event.dart';
part 'chat_openai_state.dart';

@injectable
class ChatOpenAIBloc extends Bloc<ChatOpenAIEvent, ChatOpenAIState> {
  final ChatOpenAIRepository _chatOpenAIRepository;

  ChatOpenAIBloc(this._chatOpenAIRepository) : super(ChatOpenAIInitial()) {
    on<ChatOpenAIFetchEvent>((event, emit) async {
      emit(const ChatOpenAILoading());
      OpenAI.apiKey = 'Your API Key';

      try {
        var chatCompletion = _chatOpenAIRepository.chatStream(
          messages: [
            const OpenAIChatCompletionChoiceMessageModel(
              content: "hello, what is Flutter and Dart ?",
              role: OpenAIChatMessageRole.user,
            ),
          ],
        );
        emit.forEach(chatCompletion, onData: (chatStreamEvent) {
          String? data = chatStreamEvent.choices.first.delta.content ?? '';
          String? oldMessage = state.message ?? '';
          return ChatOpenAILoaded(message: "$oldMessage $data");
        });
      } on RequestFailedException catch (e) {
        emit(ChatOpenAIError(errorMessage: e.message, statusCode: e.statusCode));
      }
    });
  }
}
