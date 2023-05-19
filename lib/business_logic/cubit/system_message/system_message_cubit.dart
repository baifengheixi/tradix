import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'system_message_state.dart';

class SystemMessageCubit extends Cubit<SystemMessageState> {
  SystemMessageCubit() : super(SystemMessageInitial());

  update(String message) {
    emit(SystemMessageUpdate(message: message));
  }

  clear() {
    emit(const SystemMessageUpdate(message: ''));
  }
}
