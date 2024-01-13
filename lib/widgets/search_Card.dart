import 'package:apptest/model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  SearchCard({
    required this.title,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          // padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: AppColors.BgSaleColor,
            image: DecorationImage(
              image: AssetImage(imageUrl),
              // image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),

          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(4.0), // Padding để tạo ổ màu cam
                    decoration: BoxDecoration(
                      color: Colors.orange, // Màu cam
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10)), // Đường viền cong
                    ),
                    child: Text(
                      '10',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      softWrap: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Description for destination ',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Từ ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSaleColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'đ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSaleColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' 1,420,739',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSaleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
