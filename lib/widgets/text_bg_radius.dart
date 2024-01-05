import 'package:flutter/material.dart';

class CustomBarWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize; // Thêm thuộc tính fontSize
  final Function()? onTap;

  const CustomBarWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.fontSize, // Thêm vào constructor
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        child: IntrinsicWidth(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize, // Sử dụng fontSize ở đây
            ),
          ),
        ),
      ),
    );
  }
}
