import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/constants/custom_text_style.dart';
import 'package:led_banner/home/banner/banner_model.dart';
import 'package:marquee/marquee.dart';
import 'package:video_player/video_player.dart';

class EditorController extends GetxController {
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
  var isVisible = true.obs;

  var banner = BannerModel(
          id: 30,
          text: '',
          fontStyle: CustomTextStyle(),
          isNeon: false,
          isRotated: false,
          isAnimated: false,
          dynamicBackground: true,
          animationSpeed: 0.0,
          backgroundColor: Color.fromRGBO(27, 29, 41, 1),
          numberOfVideo: 8,
          isAbstractImage: false,
          numberOfAbstract: 0)
      .obs;

  var bannerList = <BannerModel>[
    BannerModel(
        id: 0,
        text: 'Hello',
        fontStyle: CustomTextStyle(fontSize: 15, fontFamily: 'PressStart2P'),
        isNeon: false,
        isRotated: false,
        isAnimated: false,
        dynamicBackground: false,
        animationSpeed: 0.0,
        backgroundColor: Colors.transparent,
        numberOfVideo: 0,
        isAbstractImage: true,
        numberOfAbstract: 4),
    BannerModel(
        id: 1,
        text: 'Hello',
        fontStyle: CustomTextStyle(fontSize: 15, fontFamily: 'Outfit'),
        isNeon: true,
        isRotated: false,
        isAnimated: false,
        dynamicBackground: false,
        animationSpeed: 0.0,
        backgroundColor: Colors.transparent,
        numberOfVideo: 0,
        isAbstractImage: true,
        numberOfAbstract: 3),
    BannerModel(
        id: 2,
        text: 'Hello',
        fontStyle: CustomTextStyle(fontSize: 15, fontFamily: 'RacingSansOne'),
        isNeon: false,
        isRotated: false,
        isAnimated: false,
        dynamicBackground: false,
        animationSpeed: 0.0,
        backgroundColor: Colors.transparent,
        numberOfVideo: 0,
        isAbstractImage: true,
        numberOfAbstract: 1),
    BannerModel(
        id: 3,
        text: 'Hello',
        fontStyle: CustomTextStyle(
            fontSize: 24,
            fontFamily: 'Cinzel',
            color: Color.fromRGBO(278, 12, 124, 1)),
        isNeon: false,
        isRotated: false,
        isAnimated: false,
        dynamicBackground: false,
        animationSpeed: 0.0,
        backgroundColor: Colors.transparent,
        numberOfVideo: 0,
        isAbstractImage: true,
        numberOfAbstract: 12),
    BannerModel(
        id: 4,
        text: 'Hello',
        fontStyle: CustomTextStyle(fontSize: 15, fontFamily: 'PressStart2P'),
        isNeon: false,
        isRotated: false,
        isAnimated: false,
        dynamicBackground: false,
        animationSpeed: 0.0,
        backgroundColor: Colors.transparent,
        numberOfVideo: 0,
        isAbstractImage: true,
        numberOfAbstract: 15),
    BannerModel(
        id: 5,
        text: 'Hello',
        fontStyle: CustomTextStyle(
            fontSize: 36, fontFamily: 'Outfit', color: Colors.yellow),
        isNeon: true,
        isRotated: false,
        isAnimated: false,
        dynamicBackground: false,
        animationSpeed: 0.0,
        backgroundColor: Colors.transparent,
        numberOfVideo: 0,
        isAbstractImage: true,
        numberOfAbstract: 6),
    BannerModel(
        id: 6,
        text: 'Hello',
        fontStyle: CustomTextStyle(fontSize: 24, fontFamily: 'Cinzel'),
        isNeon: false,
        isRotated: false,
        isAnimated: false,
        dynamicBackground: false,
        animationSpeed: 0.0,
        backgroundColor: Colors.transparent,
        numberOfVideo: 0,
        isAbstractImage: true,
        numberOfAbstract: 7)
  ].obs;

  makeFontFamily(String family, int id) {
    bannerList[id].fontStyle.fontFamily = family;
    update();
    print(bannerList[id].fontStyle.fontFamily);
  }

  makeFontSize(double size, int id) {
    bannerList[id].fontStyle.fontSize = size;
    update();
    print(bannerList[id].fontStyle.fontSize);
  }

  makeFontColor(Color color, int id) {
    if (bannerList[id].isNeon == false) {
      bannerList[id].fontStyle.color = color;
    } else {
      bannerList[id].fontStyle.color = color;
      bannerList[id].fontStyle.shadows = [
        BoxShadow(color: bannerList[id].fontStyle.color!, blurRadius: 30)
      ];
      update();
    }

    update();
    print(bannerList[id].fontStyle.color);
  }

  makeShadows(List<BoxShadow> shadows, int id) {
    if (bannerList[id].isNeon == false) {
      bannerList[id].isNeon = true;
      bannerList[id].fontStyle.shadows = [
        BoxShadow(color: bannerList[id].fontStyle.color!, blurRadius: 30)
      ];
    } else {
      bannerList[id].fontStyle.shadows = [];
      bannerList[id].isNeon = false;
    }

    update();
    print(bannerList[id].fontStyle.shadows);
  }

  textVertical(int id) {
    if (bannerList[id].isRotated == false) {
      bannerList[id].isRotated = true;
    } else {
      bannerList[id].isRotated = false;
    }
    update();
  }

  animateSpeed(double speed, bool animBool, int id) {
    bannerList[id].isAnimated = animBool;
    bannerList[id].animationSpeed = speed;
    update();
    print(bannerList[id].animationSpeed);
  }

  setBackgroundColor(Color color, int id) {
    bannerList[id].dynamicBackground = false;
    bannerList[id].isAbstractImage = false;
    bannerList[id].backgroundColor = color;
    update();
    print(bannerList[id].backgroundColor);
  }

  setDynamicBackground(int number, int id) {
    bannerList[id].isAbstractImage = false;
    bannerList[id].dynamicBackground = true;
    bannerList[id].numberOfVideo = number;
    numberOfVideo.value = number;
    print(bannerList[id].numberOfVideo);
    print(bannerList.length);
    update();
  }

  setAbstractImage(int number, int id) {
    bannerList[id].dynamicBackground = false;
    bannerList[id].isAbstractImage = true;
    bannerList[id].numberOfAbstract = number;
    numberOfAbstract.value = number;
    print(bannerList[id].numberOfAbstract);
    update();
  }

  makeVisible(bool isVis) {
    isVisible.value = isVis;
    update();
  }
}
