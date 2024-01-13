import 'package:flutter/material.dart';

class ImageTextPair {
  final String imageUrl;
  final String text;

  ImageTextPair({required this.imageUrl, required this.text});
}

class TourBusWidget extends StatelessWidget {
  final List<ImageTextPair> imageTextPairs;

  const TourBusWidget({
    Key? key,
    required this.imageTextPairs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: imageTextPairs.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageTextPairs[index].imageUrl,
                fit: BoxFit.cover,
                // Placeholder and error widgets can be added for a complete solution
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  imageTextPairs[index].text,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          );
        },
      );
  }
}

// TourBusWidget(
//         imageTextPairs: [
//           ImageTextPair(
//             imageUrl: 'https://example.com/image1.jpg', // Replace with actual image URL
//             text: 'Khám phá các điểm tham quan của Thành phố Hồ Chí Minh theo tốc độ của riêng bạn trên xe buýt du lịch',
//           ),
//           ImageTextPair(
//             imageUrl: 'https://example.com/image2.jpg', // Replace with actual image URL
//             text: 'Lên xe buýt có máy lạnh và lắng nghe những bình luận hấp dẫn cho đến khi bạn sẵn sàng xuống xe',
//           ),
//           // Add more ImageTextPair instances as needed
//         ],
//       ),
//     ),