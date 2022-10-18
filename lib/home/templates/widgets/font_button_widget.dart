import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';

class FontButton {
  const FontButton(this.name, this.fontFamily);

  final String name;
  final String fontFamily;
}

final List<FontButton> fontbuttons = [
  FontButton('Aa', 'Outfit'),
  FontButton('Aa', 'PlayfairDisplay'),
  FontButton('Aa', 'Cinzel'),
  FontButton('Aa', 'RacingSansOne'),
  FontButton('Aa', 'PressStart2P'),
  FontButton('Aa', 'ArchivoBlack'),
  FontButton('Aa', 'Aclonica'),
  FontButton('야', 'NotoSansKR'),
  FontButton('야', 'NotoSerifKR'),
  FontButton('嘿', 'ZCOOLQingKeHuangYou'),
  FontButton('嘿', 'ZCOOLXiaoWei'),
];

class FontButtonTile extends StatelessWidget {
  EditorController editorController = Get.put(EditorController());

  final String name;
  final String fontFamily;
  final int id;

  FontButtonTile({
    Key? key,
    required this.name,
    required this.fontFamily,
    required this.id,
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
                editorController.makeFontFamily(fontFamily, editorController.bannerList.value[id].id);
              },
              child: Text(name,
                  style:
                      TextStyle(fontFamily: fontFamily, color: Colors.white)))),
    );
  }
}
