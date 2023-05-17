// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:tradix/presentation/screens/chat/views/chat_view.dart' as _i1;
import 'package:tradix/presentation/screens/chat_categories/views/chat_category_view.dart'
    as _i2;
import 'package:tradix/presentation/screens/home/views/home_view.dart' as _i3;
import 'package:tradix/presentation/screens/image_categories/views/Image_category_view.dart'
    as _i4;
import 'package:tradix/presentation/screens/on_boarding/views/on_boarding_view.dart'
    as _i5;
import 'package:tradix/presentation/screens/settings/views/setting_view.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ChatRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChatView(),
      );
    },
    ChatCategoryRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ChatCategoryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
      );
    },
    ImageCategoryRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ImageCategoryView(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardingView(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SettingView(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatView]
class ChatRoute extends _i7.PageRouteInfo<void> {
  const ChatRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChatCategoryView]
class ChatCategoryRoute extends _i7.PageRouteInfo<void> {
  const ChatCategoryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ChatCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatCategoryRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ImageCategoryView]
class ImageCategoryRoute extends _i7.PageRouteInfo<void> {
  const ImageCategoryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ImageCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImageCategoryRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnBoardingView]
class OnBoardingRoute extends _i7.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SettingView]
class SettingRoute extends _i7.PageRouteInfo<void> {
  const SettingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
