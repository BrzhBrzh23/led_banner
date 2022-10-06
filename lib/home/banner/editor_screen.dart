import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:led_banner/home/banner/bottom_sheet_widget.dart';
import 'package:led_banner/home/controllers/editor_controller.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  EditorController editorController = Get.put(EditorController());
  

  void showBottomSheet() => showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: CustomBottomSheet(),
          ));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            child: GetBuilder<EditorController>(
          builder: (controller) => Center(
              child: Text(editorController.text.value,
                  style: editorController.fontStyle.value)),
        )),
        Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    style: GoogleFonts.outfit(color: Colors.white),
                    onChanged: (value) => setState(() {
                      editorController.text.value = value;
                    }),
                    autocorrect: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Banner text here",
                      hintStyle: GoogleFonts.outfit(
                          color: const Color.fromRGBO(69, 75, 91, 1)),
                      fillColor: Color.fromRGBO(45, 42, 56, 1),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(45, 42, 56, 1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(45, 42, 56, 1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: Ink(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromRGBO(45, 42, 56, 1)),
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromRGBO(45, 42, 56, 1)),
                      child: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: Ink(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromRGBO(45, 42, 56, 1)),
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(45, 42, 56, 1),
                      ),
                      child: InkWell(
                        onTap: () {
                          showBottomSheet();
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
