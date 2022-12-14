import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:led_banner/home/controllers/banner_controller.dart';
import 'package:led_banner/routes/router.gr.dart';

final _appRouter = AppRouter();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerController editorController = Get.put(BannerController());

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: const Color.fromRGBO(27, 29, 41, 1),
      routes: const [
        TemplatesRouter(),
        BannerRouter(),
        SettingsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return GetBuilder<BannerController>(
            builder: (_) => Visibility(
                  visible: editorController.isVisible.value,
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Color.fromRGBO(69, 75, 91, 1),
                                width: .5))),
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
                  ),
                ));
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
