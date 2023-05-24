// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:tradix/presentation/screens/chat/views/chat_view.dart' as _i1;
import 'package:tradix/presentation/screens/chat_explore/views/chat_explore_view.dart'
    as _i6;
import 'package:tradix/presentation/screens/chat_features/views/chat_feature_view.dart'
    as _i7;
import 'package:tradix/presentation/screens/chat_histories/views/chat_history_view.dart'
    as _i8;
import 'package:tradix/presentation/screens/home/views/home_view.dart' as _i2;
import 'package:tradix/presentation/screens/image_categories/views/Image_category_view.dart'
    as _i3;
import 'package:tradix/presentation/screens/on_boarding/views/on_boarding_view.dart'
    as _i4;
import 'package:tradix/presentation/screens/settings/views/setting_view.dart'
    as _i5;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    ChatRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChatView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    ImageCategoryRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ImageCategoryView(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OnBoardingView(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingView(),
      );
    },
    ChatExploreRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChatExploreView(),
      );
    },
    ChatFeatureRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ChatFeatureView(),
      );
    },
    ChatHistoryRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ChatHistoryView(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatView]
class ChatRoute extends _i9.PageRouteInfo<void> {
  const ChatRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ImageCategoryView]
class ImageCategoryRoute extends _i9.PageRouteInfo<void> {
  const ImageCategoryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ImageCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImageCategoryRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OnBoardingView]
class OnBoardingRoute extends _i9.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SettingView]
class SettingRoute extends _i9.PageRouteInfo<void> {
  const SettingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChatExploreView]
class ChatExploreRoute extends _i9.PageRouteInfo<void> {
  const ChatExploreRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ChatExploreRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatExploreRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ChatFeatureView]
class ChatFeatureRoute extends _i9.PageRouteInfo<void> {
  const ChatFeatureRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ChatFeatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatFeatureRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ChatHistoryView]
class ChatHistoryRoute extends _i9.PageRouteInfo<void> {
  const ChatHistoryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ChatHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatHistoryRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
