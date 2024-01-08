import 'package:apptest/theme/app_color.dart';
import 'package:apptest/widgets/rating_hotel.dart';
import 'package:apptest/widgets/start_rating.dart';
import 'package:flutter/material.dart';

class CustomNearbyPlaceCard extends StatelessWidget {
  final String imagePath;
  final String hotelName;
  final double rating;
  final String ratingStatus;
  final String price;

  const CustomNearbyPlaceCard({
    Key? key,
    required this.imagePath,
    required this.hotelName,
    required this.rating,
    required this.ratingStatus,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1.5, color: AppColors.listTitleColor),
      ),
      width: 150,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 90,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  hotelName,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                StarRating(
                  rating: rating,
                  starColor: AppColors.primaryColor,
                  starSize: 12,
                ),
                const SizedBox(
                  height: 5,
                ),
                RatingRow(rating: ratingStatus, status: 'Tốt'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
