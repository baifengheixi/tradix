import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends HydratedBloc<AppConfigEvent, AppConfigState> {
  AppConfigBloc() : super(AppConfigInitial()) {
    on<AppConfigUpdateEvent>((event, emit) {
      emit(const AppConfigUpdate());
    });
  }

  @override
  AppConfigState? fromJson(Map<String, dynamic> json) {
    return AppConfigState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AppConfigState state) {
    return state.toMap();
  }
}
