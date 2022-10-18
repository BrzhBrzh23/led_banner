import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideo extends StatefulWidget {
  BackgroundVideo({super.key});
  @override
  BackgroundVideoState createState() => BackgroundVideoState();
}

class BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;
  EditorController editorController = Get.put(EditorController());

  @override
  void initState() {
    editorController.numberOfVideo.listen((_) {
      setVideo();
    });
    setVideo();
  }

  void setVideo() {
    _controller = VideoPlayerController.asset(
        'lib/assets/videos/${editorController.numberOfVideo.value}.mp4');
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {
          _controller.play();
        }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditorController>(
      builder: (controller) {
        return RotatedBox(
          quarterTurns: 1,
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: window.devicePixelRatio,
                  child: VideoPlayer(_controller),
                )
              : Text('Nodata'),
        );
      },
    );
  }
}

class VideoButton {
  VideoButton(this.numberOfVideo);

  final int numberOfVideo;
}

final List<VideoButton> videoButtons = [
  VideoButton(1),
  VideoButton(2),
  VideoButton(3),
  VideoButton(4),
  VideoButton(5),
  VideoButton(6),
  VideoButton(7),
  VideoButton(8),
  VideoButton(9),
  VideoButton(10),
  VideoButton(11),
  VideoButton(12),
  VideoButton(13),
  VideoButton(14),
  VideoButton(15),
  VideoButton(16),
  VideoButton(17),
  VideoButton(18),
  VideoButton(19),
  VideoButton(20),
  VideoButton(21),
  VideoButton(22),
];

class VideoButtonTile extends StatelessWidget {
  EditorController editorController = Get.put(EditorController());

  final int numberOfVideo;
  final int id;

  VideoButtonTile({
    Key? key,
    required this.numberOfVideo,
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
                editorController.setDynamicBackground(numberOfVideo, editorController.bannerList.value[id].id);
              },
              child: Ink(
                child: Image.asset('lib/assets/images/dynamic_background_icons/$numberOfVideo.png',
                    ),
              ))),
    );
  }
}
