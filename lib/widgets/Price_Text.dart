import 'package:apptest/model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final String first;
  final String unit;
  final String price;
  PriceText({
    required this.first,
    required this.unit,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$first',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
        children: [
          TextSpan(
            text: '$unit',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: ' $price',
            style: TextStyle(
              fontSize: 15,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
