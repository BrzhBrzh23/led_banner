import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';

class TextDirectionTile extends StatelessWidget {
  EditorController editorController = Get.put(EditorController());

  final int id;

  TextDirectionTile({
    Key? key, 
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
              color: Color.fromRGBO(45, 42, 56, 1),
            ),
            child: TextButton(
                onPressed: () {
                  editorController.textVertical(editorController.bannerList.value[id].id);
                },
                child: Row(
                  children: [
                    Expanded(
                        child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 15,
                    )),
                    RotatedBox(
                        quarterTurns: 1,
                        child: Text('Aa',
                            style: GoogleFonts.outfit(color: Colors.white))),
                  ],
                ))));
  }
}
