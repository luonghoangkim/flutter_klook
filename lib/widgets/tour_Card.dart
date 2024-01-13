import 'package:apptest/model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class TourCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  TourCard({
    required this.title,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // elevation: 4.0,
      child: Container(
        width: 200, // Set your own width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '4.8',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange,
                          ),
                          children: [
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: '(181)',
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text('4.8 (3,654)'),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.listTitleColor,
                      borderRadius: BorderRadius.circular(
                          8.0), // Đặt giá trị border radius theo nhu cầu của bạn
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    child: Text(
                      'Bán chạy',
                      style: TextStyle(
                        color: AppColors.textTitleColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '1,342,173 đ',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Từ ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'đ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' 1,420,739',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.tourTagColor,
                      borderRadius: BorderRadius.circular(
                          8.0), // Đặt giá trị border radius theo nhu cầu của bạn
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    child: Text(
                      'Chính sách đảm bảo v...',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
