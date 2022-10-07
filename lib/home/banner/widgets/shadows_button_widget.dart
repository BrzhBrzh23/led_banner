import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/editor_controller.dart';

class ShadowButton {
  ShadowButton(this.shadows, this.name);

  final List<BoxShadow> shadows;
  final String name;
}

final List<ShadowButton> shadowButtons = [
  ShadowButton([
    BoxShadow(
      color: Get.find<EditorController>().fontStyle.value.color!,
      blurRadius: 30,
    )
  ], 'Aa'),
];

class ShadowButtonTile extends StatelessWidget {
  EditorController editorController = Get.put(EditorController());

  final List<BoxShadow> shadows;
  final String name;

  ShadowButtonTile({
    Key? key,
    required this.shadows,
    required this.name,
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
              color: Color.fromRGBO(45, 42, 56, 1),
            ),
            child: TextButton(
                onPressed: () {
                  editorController.makeShadows(shadows);
                },
                child: Text(name,
                    style: GoogleFonts.outfit(color: Colors.white)))));
  }
}
