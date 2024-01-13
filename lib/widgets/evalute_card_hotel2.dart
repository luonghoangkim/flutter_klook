import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class EvaluteCardHotel extends StatelessWidget {
  final String customerName;
  final String date;
  final double rating;
  final String category;
  final String reviewContent;

  EvaluteCardHotel({
    required this.customerName,
    required this.date,
    required this.rating,
    required this.category,
    required this.reviewContent,
  });
  String formatContent(String content) {
    List<String> lines = content.split('\n');
    while (lines.length < 3) {
      lines.add(' ');
    }
    return lines.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.listTitleColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.account_circle, size: 28),
                  const SizedBox(width: 5),
                  Text(
                    customerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.textTitleColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              text: rating.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: '/5 ',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.textTitleColor,
                  ),
                ),
                TextSpan(
                  text: 'Tuyệt vời',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            category,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColors.textTitleColor,
            ),
          ),
          Text(
            formatContent(reviewContent),
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                'img/expedia_hotel.png',
                width: 69,
                height: 16,
              ),
              const SizedBox(width: 5),
              const Text('du khách'),
            ],
          ),
        ],
      ),
    );
  }
}
