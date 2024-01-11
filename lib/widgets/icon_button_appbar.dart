import 'package:flutter/material.dart';
import 'package:apptest/theme/app_color.dart';

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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 50,
      height: 50,
      margin: EdgeInsets.only(
        right: scrollPosition < scrollPositionThreshold ? 10 : 0,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: scrollPosition < scrollPositionThreshold
            ? AppColors.matteBlack
            : Colors.transparent,
      ),
      child: IconButton(
        icon: Icon(
          iconData,
          color: scrollPosition < scrollPositionThreshold
              ? Colors.white
              : iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
