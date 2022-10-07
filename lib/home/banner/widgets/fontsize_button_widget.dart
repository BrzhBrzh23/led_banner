import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/editor_controller.dart';



class FontSizeButton {
  
  FontSizeButton(this.name, this.size);

  final String name;
  final double size;
}

final List<FontSizeButton> fontSizeButtons = [
  
    FontSizeButton('24', 24),
    FontSizeButton('36', 36),
    FontSizeButton('48', 48),
    FontSizeButton('64', 64),
    FontSizeButton('72',72),
    FontSizeButton('96', 96),
    FontSizeButton('144', 144),
  ];

class FontSizeButtonTile extends StatelessWidget {
  EditorController editorController = Get.put(EditorController());

  
  final String name;
  final double size;

  FontSizeButtonTile({
    Key? key,
    required this.name,
    required this.size,
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
              onPressed: () {editorController.makeFontSize(size);}, child: Text(name, style: GoogleFonts.outfit(color: Colors.white)))),
    );
  }
}
