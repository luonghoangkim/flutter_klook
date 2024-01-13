import 'package:apptest/model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class TravelCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  TravelCard({
    required this.title,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 150,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.BgSaleColor,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 10,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              softWrap: true,
            ),
          ),
          // Other widgets can go here
        ],
      ),
    );
  }
}
