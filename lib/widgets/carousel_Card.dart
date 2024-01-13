import 'package:apptest/model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int index;

  CarouselCard(
      {required this.imageUrl, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataCarousel = DataHome.CarouselData();

    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: new AssetImage(imageUrl),
          // image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {},
              child: Container(
                width: 100,
                height: 26,
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
