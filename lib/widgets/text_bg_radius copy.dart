import 'package:flutter/material.dart';

class CustomBarWidget extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? fontSize;
  final double? iconSize;
  final IconData? iconData;
  final Function()? onTap;

  const CustomBarWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.fontSize,
    this.iconData,
    this.onTap,
    this.iconColor,
    this.iconSize,
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
          child: Row(
            children: [
              if (iconData != null)
                Icon(
                  iconData,
                  color: iconColor,
                  size: fontSize
                ),
              const SizedBox(width: 4),
              Text(
                text!,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
