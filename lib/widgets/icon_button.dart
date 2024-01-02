import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class PlusMinusIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const PlusMinusIconButton({
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          iconData,
          size: 20,
          color: AppColors.primaryColor,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
