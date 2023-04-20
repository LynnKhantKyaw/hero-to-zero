import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    this.fontSize = 14,
    this.color,
    required this.onPressed,
  });

  final String label;

  final double fontSize;

  final Color? color;

  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(),
      onPressed: onPressed!,
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize, color: color),
      ),
    );
  }
}
