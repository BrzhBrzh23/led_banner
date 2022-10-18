import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:led_banner/home/controllers/banner_controller.dart';
import 'package:led_banner/home/templates/widgets/abstract_background_widget.dart';
import 'package:led_banner/home/templates/widgets/background_video.dart';
import 'package:led_banner/home/templates/widgets/bottom_sheet_widget.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';
import 'package:marquee/marquee.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key, @PathParam('bannerId') required this.id});

  final int id;

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  EditorController editorController = Get.put(EditorController());
  BannerController bannerController = Get.put(BannerController());

  void showBottomSheet() => showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: CustomBottomSheet(id: widget.id),
          ));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditorController>(
      builder: (controller) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                if (editorController.isVisible.value == false) {
                  editorController.makeVisible(true);
                  bannerController.makeVisible(true);
                } else
                  null;
              },
              child: Container(
                decoration: BoxDecoration(
                    color: (editorController.bannerList.value[widget.id]
                                    .dynamicBackground ==
                                true ||
                            editorController.bannerList.value[widget.id]
                                    .isAbstractImage ==
                                true)
                        ? Colors.transparent
                        : editorController
                            .bannerList.value[widget.id].backgroundColor),
                child: (editorController
                            .bannerList.value[widget.id].isAbstractImage ==
                        true)
                    ? Stack(
                        children: [
                          SingleChildScrollView(
                              child: AstractBackground(
                            numberOfAbstract: editorController
                                .bannerList.value[widget.id].numberOfAbstract,
                          )),
                          Center(
                            child: SingleChildScrollView(
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: (editorController
                                                      .bannerList
                                                      .value[widget.id]
                                                      .isAnimated ==
                                                  false ||
                                              editorController.bannerList
                                                      .value[widget.id].text ==
                                                  '')
                                          ? ((editorController
                                                      .bannerList
                                                      .value[widget.id]
                                                      .isRotated ==
                                                  false)
                                              ? Text(
                                                  editorController.bannerList
                                                      .value[widget.id].text,
                                                  style: editorController
                                                      .bannerList
                                                      .value[widget.id]
                                                      .fontStyle,
                                                  textAlign: TextAlign.center,
                                                )
                                              : RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Text(
                                                    editorController.bannerList
                                                        .value[widget.id].text,
                                                    style: editorController
                                                        .bannerList
                                                        .value[widget.id]
                                                        .fontStyle,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ))
                                          : ((editorController
                                                      .bannerList
                                                      .value[widget.id]
                                                      .isRotated ==
                                                  false)
                                              ? Marquee(
                                                  text: editorController
                                                      .bannerList
                                                      .value[widget.id]
                                                      .text,
                                                  style: editorController
                                                      .bannerList
                                                      .value[widget.id]
                                                      .fontStyle,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  velocity: editorController
                                                      .bannerList
                                                      .value[widget.id]
                                                      .animationSpeed,
                                                  blankSpace: 150,
                                                )
                                              : RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Marquee(
                                                    text: editorController
                                                        .bannerList
                                                        .value[widget.id]
                                                        .text,
                                                    style: editorController
                                                        .bannerList
                                                        .value[widget.id]
                                                        .fontStyle,
                                                    velocity: editorController
                                                        .bannerList
                                                        .value[widget.id]
                                                        .animationSpeed,
                                                    blankSpace: 150,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                  ),
                                                )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : ((editorController.bannerList.value[widget.id]
                                .dynamicBackground ==
                            true)
                        ? Stack(
                            children: [
                              SingleChildScrollView(child: BackgroundVideo()),
                              Center(
                                child: SingleChildScrollView(
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Center(
                                          child: (editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .isAnimated ==
                                                      false ||
                                                  editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .text ==
                                                      '')
                                              ? ((editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .isRotated ==
                                                      false)
                                                  ? Text(
                                                      editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .text,
                                                      style: editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .fontStyle, textAlign: TextAlign.center,)
                                                  : RotatedBox(
                                                      quarterTurns: 1,
                                                      child: Text(
                                                          editorController
                                                              .bannerList
                                                              .value[widget.id]
                                                              .text,
                                                          style:
                                                              editorController
                                                                  .bannerList
                                                                  .value[
                                                                      widget.id]
                                                                  .fontStyle, textAlign: TextAlign.center,),
                                                    ))
                                              : ((editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .isRotated ==
                                                      false)
                                                  ? Marquee(
                                                      text: editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .text,
                                                      style: editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .fontStyle,
                                                      velocity: editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .animationSpeed,
                                                      blankSpace: 150,
                                                    )
                                                  : RotatedBox(
                                                      quarterTurns: 1,
                                                      child: Marquee(
                                                        text: editorController
                                                            .bannerList
                                                            .value[widget.id]
                                                            .text,
                                                        style: editorController
                                                            .bannerList
                                                            .value[widget.id]
                                                            .fontStyle,
                                                        velocity:
                                                            editorController
                                                                .bannerList
                                                                .value[
                                                                    widget.id]
                                                                .animationSpeed,
                                                        blankSpace: 150,
                                                      ),
                                                    )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : Stack(
                            children: [
                              Center(
                                child: SingleChildScrollView(
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Center(
                                          child: (editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .isAnimated ==
                                                      false ||
                                                  editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .text ==
                                                      '')
                                              ? ((editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .isRotated ==
                                                      false)
                                                  ? Text(
                                                      editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .text,
                                                      style: editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .fontStyle, textAlign: TextAlign.center,)
                                                  : RotatedBox(
                                                      quarterTurns: 1,
                                                      child: Text(
                                                          editorController
                                                              .bannerList
                                                              .value[widget.id]
                                                              .text,
                                                          style:
                                                              editorController
                                                                  .bannerList
                                                                  .value[
                                                                      widget.id]
                                                                  .fontStyle, textAlign: TextAlign.center,),
                                                    ))
                                              : ((editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .isRotated ==
                                                      false)
                                                  ? Marquee(
                                                      text: editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .text,
                                                      style: editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .fontStyle,
                                                      velocity: editorController
                                                          .bannerList
                                                          .value[widget.id]
                                                          .animationSpeed,
                                                      blankSpace: 150,
                                                    )
                                                  : RotatedBox(
                                                      quarterTurns: 1,
                                                      child: Marquee(
                                                        text: editorController
                                                            .bannerList
                                                            .value[widget.id]
                                                            .text,
                                                        style: editorController
                                                            .bannerList
                                                            .value[widget.id]
                                                            .fontStyle,
                                                        velocity:
                                                            editorController
                                                                .bannerList
                                                                .value[
                                                                    widget.id]
                                                                .animationSpeed,
                                                        blankSpace: 150,
                                                      ),
                                                    )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
              ),
            ),
            Visibility(
              visible: editorController.isVisible.value,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 60),
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromRGBO(45, 42, 56, 1)),
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(45, 42, 56, 1),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: editorController.isVisible.value,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextFormField(
                          style: GoogleFonts.outfit(color: Colors.white),
                          onChanged: (value) => setState(() {
                            editorController.bannerList.value[widget.id].text =
                                value;
                          }),
                          autocorrect: false,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Banner text here",
                            hintStyle: GoogleFonts.outfit(
                                color: const Color.fromRGBO(69, 75, 91, 1)),
                            fillColor: Color.fromRGBO(45, 42, 56, 1),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(45, 42, 56, 1)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(45, 42, 56, 1)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(45, 42, 56, 1)),
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(45, 42, 56, 1)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  editorController.makeVisible(false);
                                  bannerController.makeVisible(false);
                                });
                              },
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(45, 42, 56, 1)),
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(45, 42, 56, 1),
                            ),
                            child: InkWell(
                              onTap: () {
                                showBottomSheet();
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
