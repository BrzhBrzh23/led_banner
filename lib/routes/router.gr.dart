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
import '../home/banner/editor_screen.dart' as _i6;
import '../home/settings/settings_screen.dart' as _i3;
import '../home/templates/template_detail_screen.dart' as _i5;
import '../home/templates/templates_screen.dart' as _i4;

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
    EditorRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SettingsRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SettingsScreen(),
      );
    },
    TemplatesScreen.name: (routeData) {
      final args = routeData.argsAs<TemplatesScreenArgs>(
          orElse: () => const TemplatesScreenArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.TemplatesScreen(key: args.key),
      );
    },
    SingleTemplateRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SingleTemplateRouteArgs>(
          orElse: () => SingleTemplateRouteArgs(
              templateId: pathParams.getInt('templateId')));
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SingleTemplatePage(
          key: args.key,
          templateId: args.templateId,
        ),
      );
    },
    EditorScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EditorScreen(),
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
                  SingleTemplateRoute.name,
                  path: ':templateId',
                  parent: TemplatesRouter.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              EditorRouter.name,
              path: 'editor',
              parent: HomeRoute.name,
              children: [
                _i7.RouteConfig(
                  EditorScreen.name,
                  path: '',
                  parent: EditorRouter.name,
                )
              ],
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
/// [_i2.EmptyRouterPage]
class EditorRouter extends _i7.PageRouteInfo<void> {
  const EditorRouter({List<_i7.PageRouteInfo>? children})
      : super(
          EditorRouter.name,
          path: 'editor',
          initialChildren: children,
        );

  static const String name = 'EditorRouter';
}

/// generated route for
/// [_i3.SettingsScreen]
class SettingsRouter extends _i7.PageRouteInfo<void> {
  const SettingsRouter()
      : super(
          SettingsRouter.name,
          path: 'settings',
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i4.TemplatesScreen]
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
/// [_i5.SingleTemplatePage]
class SingleTemplateRoute extends _i7.PageRouteInfo<SingleTemplateRouteArgs> {
  SingleTemplateRoute({
    _i8.Key? key,
    required int templateId,
  }) : super(
          SingleTemplateRoute.name,
          path: ':templateId',
          args: SingleTemplateRouteArgs(
            key: key,
            templateId: templateId,
          ),
          rawPathParams: {'templateId': templateId},
        );

  static const String name = 'SingleTemplateRoute';
}

class SingleTemplateRouteArgs {
  const SingleTemplateRouteArgs({
    this.key,
    required this.templateId,
  });

  final _i8.Key? key;

  final int templateId;

  @override
  String toString() {
    return 'SingleTemplateRouteArgs{key: $key, templateId: $templateId}';
  }
}

/// generated route for
/// [_i6.EditorScreen]
class EditorScreen extends _i7.PageRouteInfo<void> {
  const EditorScreen()
      : super(
          EditorScreen.name,
          path: '',
        );

  static const String name = 'EditorScreen';
}
