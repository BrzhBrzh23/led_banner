import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle extends TextStyle {
  CustomTextStyle(
      {this.color = Colors.white,
      this.fontWeight,
      this.fontSize,
      this.fontFamily,
      this.shadows})
      : super(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily,
          shadows: shadows,
        );

  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  String? fontFamily;
  List<BoxShadow>? shadows;
}

class EditorController extends GetxController {
  var text = ''.obs;
  var fontStyle = CustomTextStyle().obs;
  var isNeon = false.obs;
  var isRotated = false.obs;

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
}
