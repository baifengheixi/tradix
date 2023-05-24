import 'package:auto_route/auto_route.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/routes/router.gr.dart';
import 'package:tradix/business_logic/blocs/app_config/app_config_bloc.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  hasAlreadyInitial() {
    return HydratedBloc.storage.read('$AppConfigBloc') == null ? false : true;
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: HomeRoute.name.path,
          page: HomeRoute.page,
          initial: hasAlreadyInitial(),
          children: [
            RedirectRoute(path: '', redirectTo: ChatExploreRoute.name),
            AutoRoute(path: ChatExploreRoute.name, page: ChatExploreRoute.page),
            AutoRoute(path: ImageCategoryRoute.name, page: ImageCategoryRoute.page),
            AutoRoute(path: ImageCategoryRoute.name, page: ImageCategoryRoute.page),
            AutoRoute(path: SettingRoute.name, page: SettingRoute.page),
          ],
        ),
        AutoRoute(
          path: OnBoardingRoute.name.path,
          page: OnBoardingRoute.page,
          initial: !hasAlreadyInitial(),
        ),
        AutoRoute(
          path: ChatRoute.name.path,
          page: ChatRoute.page,
        ),
        AutoRoute(
          path: ChatFeatureRoute.name.path,
          page: ChatFeatureRoute.page,
        ),
        AutoRoute(
          path: ChatHistoryRoute.name.path,
          page: ChatHistoryRoute.page,
        ),
      ];
}
