import 'package:flutter/material.dart';

class AnimateCircleImage extends StatelessWidget {
  const AnimateCircleImage(
      {super.key,
      required this.image,
      required this.size,
      required this.left,
      required this.top});

  final String image;

  final double size;
  final double left;
  final double top;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: left,
      top: top,
      duration: const Duration(seconds: 4),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: size,
        height: size,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
