import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
  );

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: <Color>[
            Color.fromRGBO(99, 226, 255, 1),
            Color.fromRGBO(176, 102, 254, 1)
          ],
          tileMode: TileMode.repeated,
        ).createShader(bounds);
      },
    );
  }
}
