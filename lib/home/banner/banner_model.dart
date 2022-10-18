import 'dart:ui';

import 'package:led_banner/constants/custom_text_style.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';

class BannerModel {
  BannerModel(
      {required this.id,
      required this.text,
      required this.fontStyle,
      required this.isNeon,
      required this.isRotated,
      required this.isAnimated,
      required this.dynamicBackground,
      required this.animationSpeed,
      required this.backgroundColor,
      required this.numberOfVideo,
      required this.isAbstractImage,
      required this.numberOfAbstract});

  int id;
  String text;
  CustomTextStyle fontStyle;
  bool isNeon;
  bool isRotated;
  bool isAnimated;
  bool dynamicBackground;
  double animationSpeed;
  Color backgroundColor;
  int numberOfVideo;
  bool isAbstractImage;
  int numberOfAbstract;
}

