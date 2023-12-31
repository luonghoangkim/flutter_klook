import 'package:apptest/model/hotel_model.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/custon_card_listtile.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dataWhyKlook = DataHotel.whyKlook();
    final List<Map<String, String>> dataFAQs = DataHotel.bookingFAQs();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/banner_hotel.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                AppBar(
                  backgroundColor:
                      Colors.transparent, // Đặt màu trong suốt cho AppBar
                  elevation: 0, // Loại bỏ đường viền của AppBar
                  leading: IconButton(
                    icon:
                        const Icon(Icons.navigate_before, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.message, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Khách sạn ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(14),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 109, 109, 109)
                                  .withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            InkWell(
                                child: Card(
                              color: AppColors.listTitleColor,
                              child: ListTile(
                                title: Text(
                                  'Địa điểm',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textTitleColor),
                                ),
                                subtitle: Text(
                                  'Thành phố HCM, Việt Nam',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Icon(Icons.my_location),
                              ),
                            )),
                            InkWell(
                              child: CustomCardListTitle(
                                title: 'Ngày Nhận/Trả Phòng',
                                subtitle: 'Chọn ngày',
                              ),
                            ),
                            InkWell(
                              child: CustomCardListTitle(
                                title: 'Số lượng Phòng & Khách',
                                subtitle: '2 người lớn, 1 phòng',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {},
                                child: const Text('Tìm kiếm',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ),
                            )
                          ],
                        ),
                      ),
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
                                    MaterialStateProperty.all<Color>(
                                        AppColors.primaryColor),
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
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
