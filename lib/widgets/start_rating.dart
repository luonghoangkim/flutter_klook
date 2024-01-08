import 'package:apptest/theme/app_color.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final Color starColor;
  final double starSize;

  StarRating({
    required this.rating,
    this.starColor = AppColors.primaryColor,
    this.starSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(rating.toInt(), (index) {
        return Icon(
          Icons.star,
          color: starColor,
          size: starSize,
        );
      }),
    );
  }
}
