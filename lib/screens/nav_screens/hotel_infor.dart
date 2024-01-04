import 'package:apptest/model/hotel_model.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class HotelInfor extends StatelessWidget {
  const HotelInfor({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataWhyKlook = DataHotel.whyKlook();
    final List<Map<String, String>> dataFAQs = DataHotel.bookingFAQs();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32, bottom: 16),
          child: const Text("Ưu đãi khách sạn hot ",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image: AssetImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    "img/explore_hotel.webp",
                  ),
                  fit: BoxFit.cover)),
          child: SizedBox(
            width: 149,
            height: 26,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                ),
                onPressed: () {},
                child: Container(
                  width: 149,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Center(
                    child: Text(
                      'Xem thông tin chi tiết',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 32, bottom: 16),
          child: const Text("Vì sao lựa chọn klook",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: dataWhyKlook.map((item) {
              int index = dataWhyKlook.indexOf(item);
              return Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          item['img'] ?? '',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'] ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              item['content'] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (index < dataWhyKlook.length - 1)
                    Divider(
                      color: Colors.grey[300],
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 32, bottom: 16),
          child: const Text("FAQs",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ),
        Column(
          children: dataFAQs.map((item) {
            int index = dataFAQs.indexOf(item);
            var faq = dataFAQs[index];
            return ExpansionTile(
              title: Text(faq['question']!),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(faq['answer']!),
                ),
              ],
            );
          }).toList(),
        )
      ],
    );
  }
}
