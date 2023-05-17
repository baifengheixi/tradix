import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/commons/share_preference.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/app/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  final SharedPreferences _prefs = getIt<SharedPreferences>();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: HomeRoute.name.path,
          page: HomeRoute.page,
          initial: _prefs.getBool(SharePrefs.hasInitApp.toString()) != null,
          children: [
            RedirectRoute(path: '', redirectTo: ChatCategoryRoute.name),
            AutoRoute(path: ChatCategoryRoute.name, page: ChatCategoryRoute.page),
            AutoRoute(path: ImageCategoryRoute.name, page: ImageCategoryRoute.page),
            AutoRoute(path: SettingRoute.name, page: SettingRoute.page),
          ],
        ),
        AutoRoute(
          path: OnBoardingRoute.name.path,
          page: OnBoardingRoute.page,
          initial: _prefs.getBool(SharePrefs.hasInitApp.toString()) == null,
        ),
        AutoRoute(
          path: ChatRoute.name.path,
          page: ChatRoute.page,
        ),
      ];
}
