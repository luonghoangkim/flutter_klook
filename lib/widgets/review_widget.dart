import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/custom_textbutton_hotel.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final double rating;
  final int reviewCount;
  final String reviewerName;
  final String reviewDate;
  final String reviewContent;

  const ReviewWidget({
    Key? key,
    required this.rating,
    required this.reviewCount,
    required this.reviewerName,
    required this.reviewDate,
    required this.reviewContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: '$rating',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: ' /5',
                    style: TextStyle(
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // T
            Icon(
              Icons.star,
              color: Colors.orange,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.orange,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.orange,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.orange,
              size: 20,
            ),
            Text(
              '$reviewCount Đánh giá',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.textTitleColor, width: 0.5)),
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.0),
                ListTile(
                  leading: CircleAvatar(
                    child: Text(reviewerName.substring(0, 1)),
                  ),
                  title: Text(reviewerName),
                  subtitle: Text(reviewDate),
                  trailing: Text('Đọc tất cả đánh giá'),
                ),
                SizedBox(height: 8.0),
                Text(
                  reviewContent,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
               
              ],
            ),
          ),
        ),
         CustomTextButton(buttonText: 'Đọc tất cả đánh giá')
      ],
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Review Page'),
//         ),
//         body: ReviewWidget(
//           rating: 4.5,
//           reviewCount: 482,
//           reviewerName: 'Lâm ***',
//           reviewDate: '9/8/2023',
//           reviewContent:
//               'Xe chở một vòng ngắm nhìn thành phố, mỗi thấy thành phố mình ...',
//         ),
//       ),
//     ),
//   );
// }
