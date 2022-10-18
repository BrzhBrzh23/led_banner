import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/controllers/template_detail_controller.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoCopy extends StatefulWidget {
  BackgroundVideoCopy({required this.numberOfVideo, super.key});
  final int numberOfVideo;

  @override
  BackgroundVideoCopyState createState() => BackgroundVideoCopyState();
}

class BackgroundVideoCopyState extends State<BackgroundVideoCopy> {
  late VideoPlayerController _controller;
  EditorController editorController = Get.put(EditorController());

  @override
  void initState() {
    setVideo();
  }

  void setVideo() {
    setState(() {
      _controller = VideoPlayerController.asset(
          'lib/assets/videos/${widget.numberOfVideo}.mp4');
      _controller.setLooping(true);
      _controller.initialize().then((_) => setState(() {
            _controller.play();
          }));
    });
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
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Text('Nodata'),
        );
      },
    );
  }
}
