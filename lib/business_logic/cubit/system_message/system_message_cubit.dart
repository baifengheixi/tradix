import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'system_message_state.dart';

@injectable
class SystemMessageCubit extends Cubit<SystemMessageState> {
  SystemMessageCubit() : super(SystemMessageInitial());

  update(String message) {
    emit(
      SystemMessageUpdate(
        message: message,
        isSubmitted: false,
      ),
    );
  }

  clear() {
    emit(
      const SystemMessageUpdate(
        message: '',
        isSubmitted: true,
      ),
    );
  }
}
