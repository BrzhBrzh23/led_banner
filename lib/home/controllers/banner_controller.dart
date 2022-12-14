import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/constants/custom_text_style.dart';
import 'package:led_banner/home/banner/banner_model.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';
import 'package:marquee/marquee.dart';
import 'package:video_player/video_player.dart';

class BannerController extends GetxController {
  var text = ''.obs;
  var fontStyle = CustomTextStyle().obs;
  var isNeon = false.obs;
  var isRotated = false.obs;
  var isAnimated = false.obs;
  var dynamicBackground = false.obs;
  var animationSpeed = 0.0.obs;
  var backgroundColor = Color.fromRGBO(27, 29, 41, 1).obs;
  var numberOfVideo = 0.obs;
  var isAbstractImage = false.obs;
  var numberOfAbstract = 0.obs;
  late BannerModel bannerModel;
  var isVisible = true.obs;

  makeFontFamily(String family) {
    fontStyle.value.fontFamily = family;
    update();
    print(fontStyle.value.fontFamily);
  }

  makeFontSize(double size) {
    fontStyle.value.fontSize = size;
    update();
    print(fontStyle.value.fontSize);
  }

  makeFontColor(Color color) {
    if (isNeon.value == false) {
      fontStyle.value.color = color;
    } else {
      fontStyle.value.color = color;
      fontStyle.value.shadows = [
        BoxShadow(color: fontStyle.value.color!, blurRadius: 30)
      ];
      update();
    }

    update();
    print(fontStyle.value.color);
  }

  makeShadows(List<BoxShadow> shadows) {
    if (isNeon.value == false) {
      isNeon.value = true;
      fontStyle.value.shadows = [
        BoxShadow(color: fontStyle.value.color!, blurRadius: 30)
      ];
    } else {
      fontStyle.value.shadows = [];
      isNeon.value = false;
    }

    update();
    print(fontStyle.value.shadows);
  }

  textVertical() {
    if (isRotated.value == false) {
      isRotated.value = true;
    } else {
      isRotated.value = false;
    }
    update();
  }

  animateSpeed(double speed, bool animBool) {
    isAnimated.value = animBool;
    animationSpeed.value = speed;
    update();
    print(animationSpeed.value);
  }

  setBackgroundColor(Color color) {
    dynamicBackground.value = false;
    isAbstractImage.value = false;
    backgroundColor.value = color;
    update();
    print(backgroundColor.value);
  }

  setDynamicBackground(int number) {
    isAbstractImage.value = false;
    numberOfVideo.value = number;
    dynamicBackground.value = true;
    print(numberOfVideo.value);
    update();
  }

  setAbstractImage(int number) {
    dynamicBackground.value = false;
    numberOfAbstract.value = number;
    isAbstractImage.value = true;
    print(numberOfAbstract.value);
    update();
  }

  makeVisible(bool isVis){
    isVisible.value = isVis;
    update();
  }

}


