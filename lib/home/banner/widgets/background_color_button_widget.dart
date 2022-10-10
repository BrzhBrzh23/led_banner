import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/editor_controller.dart';

class BackgroundColorButton {
  BackgroundColorButton(this.color);

  final Color color;
}

final List<BackgroundColorButton> backgroundColorButtons = [
  BackgroundColorButton(Color.fromRGBO(27, 29, 41, 1)),
  BackgroundColorButton(Color.fromRGBO(51, 26, 56, 1)),
  BackgroundColorButton(Color.fromRGBO(20, 47, 72, 1)),
  BackgroundColorButton(Color.fromRGBO(1, 11, 139, 1)),
  BackgroundColorButton(Color.fromRGBO(73, 29, 136, 1)),
  BackgroundColorButton(Color.fromRGBO(30, 140, 176, 1)),
  BackgroundColorButton(Color.fromRGBO(11, 231, 251, 1)),
  BackgroundColorButton(Color.fromRGBO(254, 204, 80, 1)),
  BackgroundColorButton(Color.fromRGBO(245, 193, 240, 1)),
  BackgroundColorButton(Color.fromRGBO(233, 83, 218, 1)),
  BackgroundColorButton(Color.fromRGBO(76, 68, 207, 1)),
  BackgroundColorButton(Color.fromRGBO(250, 68, 140, 1)),
];

class BackgroundColorButtonTile extends StatelessWidget {
  EditorController editorController = Get.put(EditorController());

  final Color color;

  BackgroundColorButtonTile({
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
                editorController.setBackgroundColor(color);
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
