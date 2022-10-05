import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:led_banner/home/app_home.dart';
import 'package:led_banner/home/banner/editor_screen.dart';
import 'package:led_banner/home/settings/settings_screen.dart';
import 'package:led_banner/home/templates/template_detail_screen.dart';
import 'package:led_banner/home/templates/templates_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(
        path: 'templates',
        name: 'TemplatesRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: TemplatesScreen,
          ),
          AutoRoute(
            path: ':templateId',
            page: SingleTemplatePage,
          )
        ],
      ),
      AutoRoute(
        path: 'editor',
        name: 'EditorRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
            path: '',
            page: EditorScreen,
          ),
        ],
      ),
      AutoRoute(
        path: 'settings',
        name: 'SettingsRouter',
        page: SettingsScreen,
      )
    ]),
  ],
)
class $AppRouter{}              
