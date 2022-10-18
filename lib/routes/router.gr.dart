// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i8;

import '../home/app_home.dart' as _i1;
import '../home/banner/banner_screen.dart' as _i3;
import '../home/settings/settings_screen.dart' as _i4;
import '../home/templates/template_detail.dart' as _i6;
import '../home/templates/templates_screen.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    TemplatesRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    BannerRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.BannerScreen(),
      );
    },
    SettingsRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsScreen(),
      );
    },
    TemplatesScreen.name: (routeData) {
      final args = routeData.argsAs<TemplatesScreenArgs>(
          orElse: () => const TemplatesScreenArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.TemplatesScreen(key: args.key),
      );
    },
    EditorRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EditorRouteArgs>(
          orElse: () => EditorRouteArgs(id: pathParams.getInt('bannerId')));
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.EditorPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              TemplatesRouter.name,
              path: 'templates',
              parent: HomeRoute.name,
              children: [
                _i7.RouteConfig(
                  TemplatesScreen.name,
                  path: '',
                  parent: TemplatesRouter.name,
                ),
                _i7.RouteConfig(
                  EditorRoute.name,
                  path: ':bannerId',
                  parent: TemplatesRouter.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              BannerRouter.name,
              path: '',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              SettingsRouter.name,
              path: 'settings',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class TemplatesRouter extends _i7.PageRouteInfo<void> {
  const TemplatesRouter({List<_i7.PageRouteInfo>? children})
      : super(
          TemplatesRouter.name,
          path: 'templates',
          initialChildren: children,
        );

  static const String name = 'TemplatesRouter';
}

/// generated route for
/// [_i3.BannerScreen]
class BannerRouter extends _i7.PageRouteInfo<void> {
  const BannerRouter()
      : super(
          BannerRouter.name,
          path: '',
        );

  static const String name = 'BannerRouter';
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRouter extends _i7.PageRouteInfo<void> {
  const SettingsRouter()
      : super(
          SettingsRouter.name,
          path: 'settings',
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i5.TemplatesScreen]
class TemplatesScreen extends _i7.PageRouteInfo<TemplatesScreenArgs> {
  TemplatesScreen({_i8.Key? key})
      : super(
          TemplatesScreen.name,
          path: '',
          args: TemplatesScreenArgs(key: key),
        );

  static const String name = 'TemplatesScreen';
}

class TemplatesScreenArgs {
  const TemplatesScreenArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'TemplatesScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.EditorPage]
class EditorRoute extends _i7.PageRouteInfo<EditorRouteArgs> {
  EditorRoute({
    _i8.Key? key,
    required int id,
  }) : super(
          EditorRoute.name,
          path: ':bannerId',
          args: EditorRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'bannerId': id},
        );

  static const String name = 'EditorRoute';
}

class EditorRouteArgs {
  const EditorRouteArgs({
    this.key,
    required this.id,
  });

  final _i8.Key? key;

  final int id;

  @override
  String toString() {
    return 'EditorRouteArgs{key: $key, id: $id}';
  }
}
