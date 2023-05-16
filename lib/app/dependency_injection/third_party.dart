import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradix/app/routes/router.dart';

@module
abstract class RegisterModule {
  @injectable
  AppRouter get appRouter => AppRouter();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
