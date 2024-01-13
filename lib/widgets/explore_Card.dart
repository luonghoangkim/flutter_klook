import 'package:apptest/model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String distance;
  final String price;
  ExploreCard({
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // elevation: 4.0,
      // height: double.infinity,
      child: Container(
        // width: 200, // Set your own width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                alignment: Alignment
                    .bottomLeft, // Điều chỉnh vị trí của text trên hình ảnh
                children: [
                  Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 100,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                        8.0), // Điều chỉnh khoảng cách từ text đến cạnh của hình ảnh
                    color: Colors.black.withOpacity(
                        0.5), // Màu nền cho text (đen với độ mờ là 50%)
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'TP Hồ Chí Minh',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        // Text('4.8 (3,654)'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    // maxLines: 3, // Giới hạn số dòng
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
                      'Chính sách đảm bảo',
                      maxLines: 1, // Giới hạn số dòng
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
