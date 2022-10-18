import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/banner_controller.dart';

class ColorButton {
  ColorButton(this.color);

  final Color color;
}

final List<ColorButton> colorButtons = [
  ColorButton(Colors.white),
  ColorButton(Colors.black),
  ColorButton(Color.fromRGBO(11, 231, 251, 1)),
  ColorButton(Colors.amber),
  ColorButton(Color.fromRGBO(250, 68, 140, 1)),
  ColorButton(Color.fromRGBO(245, 193, 240, 1)),
  ColorButton(Color.fromRGBO(233, 83, 218, 1)),
  ColorButton(Color.fromRGBO(76, 68, 207, 1)),
  ColorButton(Color.fromRGBO(112, 255, 0, 1)),
];

class ColorButtonTile extends StatelessWidget {
  BannerController editorController = Get.put(BannerController());

  final Color color;

  ColorButtonTile({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(),
              color: color),
          child: GestureDetector(
              onTap: () {
                editorController.makeFontColor(color);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(),
                    color: color),
                
              ))),
    );
  }
}
