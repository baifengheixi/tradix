import 'package:bloc/bloc.dart';
import 'package:dart_openai/openai.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:tradix/data/repositories/chat_openai_repository.dart';

part 'ai_message_event.dart';
part 'ai_message_state.dart';

@injectable
class AIMessageBloc extends Bloc<AIMessageEvent, AIMessageState> {
  final ChatOpenAIRepository _chatOpenAIRepository;

  AIMessageBloc(this._chatOpenAIRepository) : super(AIMessageInitial()) {
    on<AIMessageFetchEvent>((event, emit) async {
      emit(AIMessageLoading());
      OpenAI.apiKey = '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';

      try {
        var chatCompletion = _chatOpenAIRepository.chatStream(
          messages: event.history,
        );

        await emit.forEach(chatCompletion, onData: (chatStreamEvent) {
          String? data = chatStreamEvent.choices.first.delta.content ?? '';

          return AIMessageLoaded(message: "${state.message} $data");
        }).whenComplete(() {
          emit(AIMessageLoaded(message: state.message, isCompleted: true));
        });
      } on RequestFailedException catch (e) {
        emit(AIMessageError(errorMessage: e.message));
      }
    });
  }
}
