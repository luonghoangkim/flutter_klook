import 'package:apptest/model/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class SaleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataCarousel = DataHome.CarouselData();

    return Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.BgSaleColor,
        image: DecorationImage(
          image: AssetImage('img/flash_sales.webp'),
          // image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {},
            child: Container(
              width: 100,
              height: 26,
              margin: EdgeInsets.only(top: 10,left: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child:                   Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // verticalDirection: VerticalDirection.down,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 0,
                            left: 5), // Đặt giá trị margin theo nhu cầu của bạn
                        child: Icon(
                          Icons.lock_clock_sharp,
                          color: AppColors.textSaleColor,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'hah1',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSaleColor),
                      ),
                    ],
                  ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '2024 Đi đâu chơi ?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            softWrap: true, // Cho phép xuống dòng khi văn bản vượt quá độ rộng
          ),
          const SizedBox(height: 5),
          Text(
            'Deal du lịch hot',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: AppColors.contentSaleColor,
            ),
            softWrap: true, // Cho phép xuống dòng khi văn bản vượt quá độ rộng
          ),
           TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {},
            child: Container(
              width: 70,
              height: 26,
              margin: EdgeInsets.only(top: 10,left: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child:                   Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // verticalDirection: VerticalDirection.down,
                    children: [
                     
                      const SizedBox(width: 10),
                      Text(
                        'Đặt ngay',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSaleColor),
                      ),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
