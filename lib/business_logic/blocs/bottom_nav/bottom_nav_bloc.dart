import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

@Injectable()
class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<BottomNavUpdateIndexEvent>((event, emit) {
      emit(BottomNavUpdateIndex(index: event.index));
    });
  }
}
