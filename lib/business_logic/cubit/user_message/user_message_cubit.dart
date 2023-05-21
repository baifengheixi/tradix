import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'user_message_state.dart';

@injectable
class UserMessageCubit extends Cubit<UserMessageState> {
  UserMessageCubit() : super(UserMessageInitial());

  update(String message) {
    emit(UserMessageUpdate(
      message: message,
      isSubmitted: false,
    ));
  }

  clear() {
    emit(const UserMessageUpdate(
      message: '',
      isSubmitted: true,
    ));
  }
}
