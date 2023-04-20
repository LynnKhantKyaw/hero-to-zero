import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    super.key,
    required this.label,
    this.width = 100,
    this.height = 55,
    required this.onPressed,
  });

  final String label;

  final double width;
  final double height;

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          minimumSize: Size(width, height),
          padding: const EdgeInsets.all(10)),
      onPressed: onPressed,
      child: Text(
        label,
      ),
    );
  }
}
