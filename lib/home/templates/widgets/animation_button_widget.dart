import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';

class AnimationButton {
  AnimationButton(this.isAnimated, this.speed);

  final bool isAnimated;
  final double speed;
}

final List<AnimationButton> animationButtons = [
  AnimationButton(false, 0),
  AnimationButton(true, 100),
  AnimationButton(true, 200),
  AnimationButton(true, 300),
  AnimationButton(true, 400),
];

class AnimationButtonTile extends StatelessWidget {
  EditorController editorController = Get.put(EditorController());

  final bool isAnimated;
  final double speed;
  final int id;

  AnimationButtonTile({
    Key? key,
    required this.isAnimated,
    required this.id,
    required this.speed,
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
              color: Color.fromRGBO(45, 42, 56, 1)),
          child: TextButton(
              onPressed: () {
                editorController.animateSpeed(speed, isAnimated, editorController.bannerList.value[id].id);
              },
              child:
                  Text((speed == 0)?'Still':(speed/200).toString(), style: GoogleFonts.outfit(color: Colors.white)))),
    );
  }
}
