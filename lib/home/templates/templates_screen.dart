import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/templates/widgets/background_video.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';
import 'package:led_banner/home/templates/template_detail.dart';

import '../../routes/router.gr.dart';

class TemplatesScreen extends StatefulWidget {
  TemplatesScreen({Key? key}) : super(key: key);

  @override
  State<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  EditorController editorController = Get.put(EditorController());
  var list;

  void initState() {
    editorController.bannerList.listen((_) {
      getData();
    });

    getData();
  }

  void getData() {
    setState(() {
      var data = editorController.bannerList;
      list = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditorController>(builder: (_) {
      return Scaffold(
          backgroundColor: Color.fromRGBO(45, 42, 56, 1),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Templates',
              style: GoogleFonts.outfit(fontSize: 22, color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, i) => GestureDetector(
                            onTap: () async {
                              await context.router
                                  .push(EditorRoute(id: list[i].id));
                              setState(() {
                                list = list;
                              });
                            },
                            child: Container(
                              height: 80,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                margin: const EdgeInsets.only(bottom: 24),
                                child: Stack(children: [
                                  (list[i].dynamicBackground == true &&
                                          list[i].isAbstractImage == false)
                                      ? Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'lib/assets/images/dynamic_background_icons/${list[i].numberOfVideo}.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : (list[i].isAbstractImage == true)
                                          ? Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'lib/assets/images/abstract_background/${list[i].numberOfAbstract}.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      list[i].backgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0)),
                                            ),
                                  Center(
                                    child: Text(
                                      list[i].text,
                                      style: list[i].fontStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          )))));
    });
  }
}
