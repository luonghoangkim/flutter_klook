import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final VoidCallback onPressed;
  final double scrollPositionThreshold;
  final double scrollPosition;  

  IconButtonWidget({
    required this.iconData,
    required this.iconColor,
    required this.onPressed,
    this.scrollPositionThreshold = 101.0,
    required this.scrollPosition,  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: scrollPosition < scrollPositionThreshold
            ? AppColors.matteBlack
            : Colors.transparent,
      ),
      child: IconButton(
        icon: Icon(iconData, color: scrollPosition < scrollPositionThreshold ? Colors.white : iconColor),
        onPressed: onPressed,
      ),
    );
  }
}