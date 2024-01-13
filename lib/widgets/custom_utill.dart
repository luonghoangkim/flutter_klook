import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class CustomUtillItem extends StatelessWidget {
  final String imageAsset;
  final String title;

  CustomUtillItem({required this.imageAsset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 17),
      padding: EdgeInsets.all(8),
      height: 95,
      width: 125,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.listTitleColor, // Màu sắc đen
          width: 2.0, // Chiều rộng 2
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.end, // Căn chỉnh theo chiều ngang
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Căn chỉnh theo chiều dọc
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  softWrap:
                      true, // Cho phép xuống dòng khi văn bản vượt quá độ rộng
                ),
              ),
            ],
          ),
          Image.asset(
            imageAsset,
            width: 24,
            height: 25,
          )
        ],
      ),
    );
  }
}
