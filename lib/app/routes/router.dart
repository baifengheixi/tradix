import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/app/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  final SharedPreferences _prefs = getIt<SharedPreferences>();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: _prefs.getBool("hasInitApp") != null,
          children: [
            RedirectRoute(path: '', redirectTo: 'chats'),
            AutoRoute(path: 'chats', page: ChatCategoryRoute.page),
            AutoRoute(path: 'images', page: ImageCategoryRoute.page),
            AutoRoute(path: 'settings', page: SettingRoute.page),
          ],
        ),
        AutoRoute(
          page: OnBoardingRoute.page,
          initial: _prefs.getBool("hasInitApp") == null,
        ),
      ];
}
