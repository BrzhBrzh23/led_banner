import 'package:flutter/material.dart';

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