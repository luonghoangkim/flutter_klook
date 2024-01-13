import 'package:flutter/material.dart';

enum IconPosition {
  left,
  right,
}

class TextWithIcon extends StatelessWidget {
  final String text;
  final IconData iconData;
  final IconPosition iconPosition;
  final TextStyle? textStyle;
  final TextStyle? iconStyle;

  TextWithIcon({
    required this.text,
    required this.iconData,
    this.iconPosition = IconPosition.left,
    this.textStyle,
    this.iconStyle,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (iconPosition == IconPosition.left) {
      children.addAll([
        SizedBox(height: 6),
        Icon(
          iconData,
          color: iconStyle?.color ??
              Colors.black, // Sử dụng iconStyle hoặc màu mặc định
          size:
              iconStyle?.fontSize, // Sử dụng iconStyle hoặc kích thước mặc định
        ),
        SizedBox(width: 5),
        Text(
          text,
          style: textStyle ??
              TextStyle(
                  fontSize: 16,
                  color: Colors.black), // Sử dụng textStyle hoặc mặc định
        ),
      ]);
    } else {
      children.addAll([
        SizedBox(height: 6),
        Text(
          text,
          style: textStyle ??
              TextStyle(
                  fontSize: 16,
                  color: Colors.black), // Sử dụng textStyle hoặc mặc định
        ),
        SizedBox(width: 5),
        Icon(
          iconData,
          color: iconStyle?.color ??
              Colors.black, // Sử dụng iconStyle hoặc màu mặc định
          size:
              iconStyle?.fontSize, // Sử dụng iconStyle hoặc kích thước mặc định
        ),
      ]);
    }

    return Wrap(
      children: children,
    );
  }
}
