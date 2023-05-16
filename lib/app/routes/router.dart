import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/presentation/screens/home/home.dart';
import 'package:tradix/presentation/screens/on_boarding/on_boarding.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  final SharedPreferences _prefs = getIt<SharedPreferences>();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: _prefs.getBool("hasInitApp") != null,
        ),
        AutoRoute(
          page: OnBoardingRoute.page,
          initial: _prefs.getBool("hasInitApp") == null,
        ),
      ];
}
