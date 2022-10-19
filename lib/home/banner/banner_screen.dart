import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:led_banner/home/banner/widgets/background_video.dart';
import 'package:led_banner/home/banner/widgets/bottom_sheet_widget.dart';
import 'package:led_banner/home/controllers/banner_controller.dart';
import 'package:led_banner/home/banner/widgets/abstract_background_widget.dart';
import 'package:marquee/marquee.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final GlobalKey<_SavingBannerState> _savingState =
      GlobalKey<_SavingBannerState>();

  BannerController editorController = Get.put(BannerController());

  void showBottomSheet() => showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: CustomBottomSheet(),
          ));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(
      builder: (controller) {
        return Stack(
          children: [
            SavingBanner(
              editorController: editorController,
              key: _savingState,
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
                            editorController.text.value = value;
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
                                FocusManager.instance.primaryFocus?.unfocus();
                                setState(() {
                                  editorController.makeVisible(false);
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

class SavingBanner extends StatefulWidget {
  const SavingBanner({
    Key? key,
    required this.editorController,
  }) : super(key: key);

  final BannerController editorController;

  @override
  State<SavingBanner> createState() => _SavingBannerState();
}

class _SavingBannerState extends State<SavingBanner> {
  String screenshotButtonText = 'Save screenshot';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (widget.editorController.isVisible.value == false)
          ? widget.editorController.makeVisible(true)
          : null,
      child: Container(
        decoration: BoxDecoration(
            color: (widget.editorController.dynamicBackground.value == true ||
                    widget.editorController.isAbstractImage.value == true)
                ? Colors.transparent
                : widget.editorController.backgroundColor.value),
        child: (widget.editorController.isAbstractImage.value == true)
            ? Stack(
                children: [
                  SingleChildScrollView(child: AstractBackground()),
                  BannerText(editorController: widget.editorController),
                ],
              )
            : ((widget.editorController.dynamicBackground.value == true)
                ? Stack(
                    children: [
                      SingleChildScrollView(child: BackgroundVideo()),
                      BannerText(editorController: widget.editorController),
                    ],
                  )
                : Stack(
                    children: [
                      BannerText(editorController: widget.editorController),
                    ],
                  )),
      ),
    );
  }
}

class BannerText extends StatelessWidget {
  const BannerText({
    Key? key,
    required this.editorController,
  }) : super(key: key);

  final BannerController editorController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: (editorController.isAnimated.value == false ||
                        editorController.text.value == '')
                    ? ((editorController.isRotated.value == false)
                        ? Text(editorController.text.value,
                            style: editorController.fontStyle.value,
                            textAlign: TextAlign.center)
                        : RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              editorController.text.value,
                              style: editorController.fontStyle.value,
                              textAlign: TextAlign.center,
                            ),
                          ))
                    : ((editorController.isRotated.value == false)
                        ? Marquee(
                            text: editorController.text.value,
                            style: editorController.fontStyle.value,
                            velocity: editorController.animationSpeed.value,
                            blankSpace: 150,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          )
                        : RotatedBox(
                            quarterTurns: 1,
                            child: Marquee(
                              text: editorController.text.value,
                              style: editorController.fontStyle.value,
                              velocity: editorController.animationSpeed.value,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              blankSpace: 150,
                            ),
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
