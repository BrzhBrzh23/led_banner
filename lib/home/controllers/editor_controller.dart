import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle extends TextStyle {
  CustomTextStyle({this.color = Colors.white, this.fontWeight, this.fontSize, this.fontFamily})
      : super(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily,
        );

  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  String? fontFamily;
}

class EditorController extends GetxController {
  var text = ''.obs;
  var fontStyle = CustomTextStyle().obs;

  makeFontFamily(String family){
    fontStyle.value.fontFamily = family;
    update();
    print(fontStyle.value.fontFamily);
  }

  makeFontSize(double size) {
    fontStyle.value.fontSize = size;
    update();
    print(fontStyle.value.fontSize);
  }

}
