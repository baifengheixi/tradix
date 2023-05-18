part of 'app_config_bloc.dart';

@immutable
class AppConfigState {
  final bool? hasInitApp;

  const AppConfigState({
    this.hasInitApp = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'hasInitApp': hasInitApp,
    };
  }

  factory AppConfigState.fromMap(Map<String, dynamic> map) {
    return AppConfigState(
      hasInitApp: map['hasInitApp'] as bool,
    );
  }
}

class AppConfigInitial extends AppConfigState {}

class AppConfigUpdate extends AppConfigState {
  const AppConfigUpdate() : super(hasInitApp: true);
}
