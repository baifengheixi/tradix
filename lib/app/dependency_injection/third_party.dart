import 'package:injectable/injectable.dart';
import 'package:tradix/app/routes/router.dart';

@module
abstract class RegisterModule {
  @injectable
  AppRouter get appRouter => AppRouter();
}
