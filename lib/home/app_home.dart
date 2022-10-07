import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:led_banner/routes/router.gr.dart';
import 'package:get/get.dart';

final _appRouter = AppRouter();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      // appBarBuilder: (_, tabsRouter) => AppBar(
      //   backgroundColor: Colors.indigo,
      //   title: const Text('FlutterBottomNav'),
      //   centerTitle: true,
      //   leading: const AutoBackButton(),
      // ),
      backgroundColor: const Color.fromRGBO(27, 29, 41, 1),
      routes: const [
        TemplatesRouter(),
        EditorRouter(),
        SettingsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Color.fromRGBO(69, 75, 91, 1), width: .5))),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: const Color.fromRGBO(27, 29, 41, 1),
            currentIndex: tabsRouter.activeIndex,
            unselectedItemColor: Color.fromRGBO(69, 75, 91, 1),
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(99, 226, 255, 1),
                        Color.fromRGBO(176, 102, 254, 1)
                      ],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.menu),
                ),
                label: '-',
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(99, 226, 255, 1),
                        Color.fromRGBO(176, 102, 254, 1)
                      ],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.edit),
                ),
                label: '-',
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(99, 226, 255, 1),
                        Color.fromRGBO(176, 102, 254, 1)
                      ],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: const Icon(Icons.settings),
                ),
                label: '-',
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              )
            ],
            
          ),
        );
      },
    );
  }
}

class AppHome extends StatelessWidget {
  AppHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Nav Bar with Nested Routing',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
