import 'package:apptest/widgets/MultiAvatar.dart';
import 'package:apptest/widgets/Price_Text.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class TietKiemCard extends StatelessWidget {
  // final String text;
  // final IconData iconData;
  // final IconPosition iconPosition;
  // final TextStyle? textStyle;
  // final TextStyle? iconStyle;

  // TietKiemCard({
  //   required this.text,
  //   required this.iconData,
  //   this.iconPosition = IconPosition.left,
  //   this.textStyle,
  //   this.iconStyle,
  // });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.textTitleColor, width: 0.5)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex:6,
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          padding: EdgeInsets.all(5),
                          // color: Colors.white,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 1)),
                          child: Text(
                            'Uư đã lên tớ  17%',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          'Klook Pass Hồ Chí Minh',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        // Text('1,400,000đ', style: TextStyle(color: Colors.red)),
                        // Text('1,700,000đ',
                        //     style: TextStyle(
                        //         decoration: TextDecoration.lineThrough)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PriceText(first: ' ', unit: 'đ', price: '467,500'),
                            RichText(
                              text: TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textTitleColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'đ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textTitleColor,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  TextSpan(
                                    text: '1,000,000',
                                    style: TextStyle(
                                      fontSize: 15,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Icons and reviews could be a Row of Icon and Text widgets
                        SizedBox(height: 5,),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: MultiAvatar(
                                avatarUrls: [
                                  'https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png',
                                 'https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png',
                                 'https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png',
                                ],
                              ),
                            ),
                            SizedBox(width: 5,),
                            Flexible(child: Text('300+ Đã được ...')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex:5,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          alignment: Alignment
                              .topRight, // Căn chỉnh các child về phía trên bên phải

                          children: <Widget>[
                            Container(
                              width: 140,
                              height: 100,
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://res.klook.com/image/upload/fl_lossy.progressive,q_auto/w_136,h_136,c_fill/c_fill,w_420,h_260/activities/oklw8nrqcrhpxz2bjbpv.webp'),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(
                                        0.8), // Màu mờ và độ mờ (từ 0.0 đến 1.0)
                                    BlendMode.darken, // Chế độ kết hợp màu
                                  ),
                                ),
                              ),
                            ),
                            // Positioned(
                            //   top: 0,
                            //   right: 15,
                            //   child: Image.network(
                            //     'https://res.klook.com/image/upload/fl_lossy.progressive,q_auto/w_136,h_136,c_fill/c_fill,w_420,h_260/activities/oklw8nrqcrhpxz2bjbpv.webp',
                            //     width: 100,
                            //     fit: BoxFit.fill,
                            //     height: 100,
                            //   ),
                            // ),
                            Positioned(
                              top: 0,
                              right: 20,
                              child: Image.network(
                                'https://res.klook.com/image/upload/fl_lossy.progressive,q_auto/w_136,h_136,c_fill/c_fill,w_420,h_260/activities/lvnxfcz989rlat8jndf0.webp',
                                width: 100,
                                fit: BoxFit.fill,
                                height: 100,
                              ),
                            ),
                            // Positioned(
                            //   top: 0,
                            //   right: 40,
                            //   child: Container(
                            //     width: 100,
                            //     height: 100,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(
                            //           10), // Đặt bán kính bo góc là 10.0
                            //     ),
                            //     child: Image.network(
                            //       'https://res.klook.com/image/upload/fl_lossy.progressive,w_500,h_334,c_fill,q_85/activities/rzcfdas2hdtkar2504d2.webp',
                            //       fit: BoxFit.fill,
                            //     ),
                            //   ),
                            // ),
                            Positioned(
                              top: 0,
                              right: 40,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://res.klook.com/image/upload/fl_lossy.progressive,w_500,h_334,c_fill,q_85/activities/rzcfdas2hdtkar2504d2.webp'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                right: 10,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black.withOpacity(0.5)),
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    '+13',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            IntrinsicWidth(
              child: RichText(
                text: TextSpan(
                  text: 'Bao gồm ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textTitleColor,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'Vé xe buýt 2 tầng ngắm cảnh ở Hồ Chí Minh từ CitySightseeing',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' và ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textTitleColor,
                      ),
                    ),
                    TextSpan(
                      text: '12',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'điểm tham quan ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textTitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'xem chi tiet',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
