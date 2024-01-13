import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimatedIconButton extends StatelessWidget {
  final double scrollPosition;
  final Color iconColor;
  final Color boxColor;
  final IconData iconData;
  final VoidCallback onPressed;
  final double scrollSize;

  const AnimatedIconButton({
    Key? key,
    required this.scrollPosition,
    required this.iconColor,
    required this.boxColor,
    required this.iconData,
    required this.onPressed,
    required this.scrollSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 50, // Đặt chiều rộng của hình tròn
      height: 50,

      margin: EdgeInsets.only(right: scrollPosition < scrollSize ? 10 : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        // color: scrollPosition < scrollSize ? Colors.white : Colors.transparent,
      ),
      child: IconButton(
        icon: Icon(iconData, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}
