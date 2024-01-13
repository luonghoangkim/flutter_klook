import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class RecentCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  RecentCard(
      {required this.title,
      required this.price,
      required this.imageUrl,
      required String img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.transparent, // Màu nền trong suốt

        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(8), // Đặt giá trị border radius tùy ý
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            maxLines: 2, // Giới hạn số dòng
            overflow: TextOverflow.ellipsis, // Hiển thị dấu ...

            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: 'đ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                decoration: TextDecoration
                    .underline, // Thêm gạch dưới cho toàn bộ văn bản
              ),
              children: [
                TextSpan(
                  text: ' ', // Thêm ký tự xuống dòng
                ),
                TextSpan(
                  text: price, // Phần còn lại của văn bản
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
