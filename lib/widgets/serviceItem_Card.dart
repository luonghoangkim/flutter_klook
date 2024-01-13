import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/custom_button2.dart';
import 'package:flutter/material.dart';

class ServiceItem_Cart extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;

  ServiceItem_Cart({
    required this.title,
    required this.subTitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        // height: 120,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.listTitleColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          horizontalTitleGap: 60,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: title + ' ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '\n',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: subTitle,
                      style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                      children: [
                        TextSpan(
                          text: 'đ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' $price',
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
                  CustomButton(
                    text: 'Chọn',
                    // icon: Icons.check, // Replace with your desired icon
                    onTap: () {
                      // Your tap callback
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
