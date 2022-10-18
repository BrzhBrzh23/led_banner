import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/abstract_background_widget.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/animation_button_widget.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/background_color_button_widget.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/background_video.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/color_button_widget.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/font_button_widget.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/fontsize_button_widget.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/shadows_button_widget.dart';
import 'package:led_banner/home/banner/banner_screen/widgets/text_direction_button.dart';
import 'package:led_banner/home/controllers/banner_controller.dart';

class CustomBottomSheet extends StatelessWidget {
  BannerController editorController = Get.put(BannerController());

  CustomBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromRGBO(0, 0, 0, 0),
        height: MediaQuery.of(context).size.height / 2.1,
        width: MediaQuery.of(context).size.width,
        child: DefaultTabController(
            length: 2,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  appBar: TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    tabs: [
                      Tab(
                        child: Text(
                          'Text',
                          style: GoogleFonts.outfit(color: Colors.white),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Background',
                          style: GoogleFonts.outfit(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Color.fromRGBO(0, 0, 0, .3),
                  body: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Color.fromRGBO(69, 75, 91, 1),
                                    width: .5))),
                        child: TabBarView(children: <Widget>[
                          SingleChildScrollView(
                              child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 6),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Font',
                                        style: GoogleFonts.outfit(
                                            fontSize: 15,
                                            color: Colors.white))),
                              ),
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  itemCount: fontbuttons.length,
                                  itemBuilder: ((context, index) =>
                                      FontButtonTile(
                                        name: fontbuttons[index].name,
                                        fontFamily:
                                            fontbuttons[index].fontFamily,
                                      )),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 6),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Font Size',
                                        style: GoogleFonts.outfit(
                                            fontSize: 15,
                                            color: Colors.white))),
                              ),
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  itemCount: fontSizeButtons.length,
                                  itemBuilder: ((context, index) =>
                                      FontSizeButtonTile(
                                        name: fontSizeButtons[index].name,
                                        size: fontSizeButtons[index].size,
                                      )),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 6),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Font Color',
                                        style: GoogleFonts.outfit(
                                            fontSize: 15,
                                            color: Colors.white))),
                              ),
                              Container(
                                height: 50,
                                child: ListView.builder(
                                  itemCount: colorButtons.length,
                                  itemBuilder: ((context, index) =>
                                      ColorButtonTile(
                                        color: colorButtons[index].color,
                                      )),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 6),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Effect',
                                        style: GoogleFonts.outfit(
                                            fontSize: 15,
                                            color: Colors.white))),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                child: ListView.builder(
                                  itemCount: shadowButtons.length,
                                  itemBuilder: ((context, index) =>
                                      ShadowButtonTile(
                                        shadows: shadowButtons[index].shadows,
                                        name: shadowButtons[index].name,
                                      )),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 6),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Text Direction',
                                        style: GoogleFonts.outfit(
                                            fontSize: 15,
                                            color: Colors.white))),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                child: ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: ((context, index) =>
                                      TextDirectionTile()),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 6),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Speed',
                                        style: GoogleFonts.outfit(
                                            fontSize: 15,
                                            color: Colors.white))),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 50,
                                child: ListView.builder(
                                  itemCount: animationButtons.length,
                                  itemBuilder: ((context, index) =>
                                      AnimationButtonTile(
                                        speed: animationButtons[index].speed,
                                        isAnimated:
                                            animationButtons[index].isAnimated,
                                      )),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                ),
                              ),
                            ],
                          )),
                          SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 6),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Background Color',
                                          style: GoogleFonts.outfit(
                                              fontSize: 15,
                                              color: Colors.white))),
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.builder(
                                    itemCount: backgroundColorButtons.length,
                                    itemBuilder: ((context, index) =>
                                        BackgroundColorButtonTile(
                                          color: backgroundColorButtons[index]
                                              .color,
                                        )),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 6),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Dynamic Background',
                                          style: GoogleFonts.outfit(
                                              fontSize: 15,
                                              color: Colors.white))),
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.builder(
                                    itemCount: videoButtons.length,
                                    itemBuilder: ((context, index) =>
                                        VideoButtonTile(
                                            numberOfVideo: videoButtons[index]
                                                .numberOfVideo)),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 6),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Abstract background',
                                          style: GoogleFonts.outfit(
                                              fontSize: 15,
                                              color: Colors.white))),
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.builder(
                                    itemCount: abstractButtons.length,
                                    itemBuilder: ((context, index) =>
                                        AbstractButtonTile(
                                            numberOfAbstract: abstractButtons[index]
                                                .numberOfAbstract)),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])),
                  ),
                ))));
  }
}
