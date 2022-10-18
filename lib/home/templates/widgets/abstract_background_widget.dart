import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';
import 'package:video_player/video_player.dart';

class AstractBackground extends StatefulWidget {
  AstractBackground({required this.numberOfAbstract, super.key});
  final int numberOfAbstract;

  @override
  AstractBackgroundState createState() => AstractBackgroundState();
}

class AstractBackgroundState extends State<AstractBackground> {
  EditorController editorController = Get.put(EditorController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
              "lib/assets/images/abstract_background/${widget.numberOfAbstract}.png"),
        ),
      ),
    );
  }
}

class AbstractButton {
  AbstractButton(this.numberOfAbstract);

  final int numberOfAbstract;
}

final List<AbstractButton> abstractButtons = [
  AbstractButton(1),
  AbstractButton(2),
  AbstractButton(3),
  AbstractButton(4),
  AbstractButton(5),
  AbstractButton(6),
  AbstractButton(7),
  AbstractButton(8),
  AbstractButton(9),
  AbstractButton(10),
  AbstractButton(11),
  AbstractButton(12),
  AbstractButton(13),
  AbstractButton(14),
  AbstractButton(15),
];

class AbstractButtonTile extends StatelessWidget {
  EditorController editorController = Get.put(EditorController());

  final int numberOfAbstract;
  final int id;

  AbstractButtonTile({
    Key? key,
    required this.numberOfAbstract,
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
          child: InkWell(
            onTap: () {
              editorController.setAbstractImage(numberOfAbstract, editorController.bannerList.value[id].id);
            },
            child: Ink(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(),
                  color: Color.fromRGBO(45, 42, 56, 1)),
              child: Image.asset(
                'lib/assets/images/abstract_background/$numberOfAbstract.png',
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }
}
