import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  AppLargeText(
      {super.key,
      required this.size,
      required this.text,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: TextStyle(
            color: color,
            overflow: TextOverflow.ellipsis,
            fontSize: size,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
