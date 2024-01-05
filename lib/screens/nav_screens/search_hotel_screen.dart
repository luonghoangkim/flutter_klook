import 'package:apptest/model/hotel_model.dart';
import 'package:apptest/screens/nav_screens/search_location_screen.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/bottom_appbar_button.dart';
import 'package:apptest/widgets/image_slider.dart';
import 'package:apptest/widgets/start_rating.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var a = ''.obs;
  var b = ''.obs;

  void updateA(String newValue) {
    a.value = newValue;
    update();
  }

  void updateB(String newValue) {
    b.value = newValue;
    update();
  }
}

class SearchHotelScreen extends StatefulWidget {
  const SearchHotelScreen({Key? key}) : super(key: key);

  @override
  State<SearchHotelScreen> createState() => _SearchHotelScreenState();
}

class _SearchHotelScreenState extends State<SearchHotelScreen> {
  final MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> searchData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    RxString country = myController.b;
    country = (myController.b.isNotEmpty)
        ? myController.b
        : RxString(searchData['country']?.toString() ?? '');

    RxString selectedCity = myController.a;
    selectedCity = (myController.a.isNotEmpty)
        ? myController.a
        : RxString(searchData['city']?.toString() ?? '');

    String rangeStart = searchData['rangeStart']?.toString() ?? '';
    String rangeEnd = searchData['rangeEnd']?.toString() ?? '';

    DateTime? startDate;
    DateTime? endDate;
    if (rangeStart.isNotEmpty && rangeEnd.isNotEmpty) {
      try {
        startDate = DateTime.parse(rangeStart);
        endDate = DateTime.parse(rangeEnd);
      } catch (e) {}
    }
    String formattedStartDate =
        startDate != null ? DateFormat('dd/MM').format(startDate) : '';
    String formattedEndDate =
        endDate != null ? DateFormat('dd/MM').format(endDate) : '';

    final List<Map<String, dynamic>> dataHotel = DataHotel.hotelSearch();
    // print('selectedCity: ${selectedCity}');
    var selectedCityData = dataHotel.firstWhere(
        (city) => city['name'] == selectedCity.value,
        orElse: () => {});

    void navigateToSearchPage(BuildContext context) async {
      final result = await Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return SearchLocationScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
      // print('result: ${result['name']}');
      if (result != null && result is Map<String, String>) {
        myController.updateA(result['name']!);
        myController.updateB(result['country']!);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
              decoration: BoxDecoration(
                  color: AppColors.listTitleColor,
                  borderRadius: BorderRadius.circular(99)),
              child: Row(children: [
                InkWell(
                  onTap: (() {}),
                  child: Container(
                    child: formattedStartDate.isNotEmpty &&
                            formattedEndDate.isNotEmpty
                        ? Column(children: [
                            Text(
                              formattedStartDate,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              formattedEndDate,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ])
                        : const Text(
                            'Chọn ngày',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.black,
                ),
                const SizedBox(width: 20),
                Icon(
                  Icons.search,
                  size: 16,
                  color: Colors.grey[500],
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      navigateToSearchPage(context);
                    },
                    child: Obx(
                      () => Text('$selectedCity , $country',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.message, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomAppBarButton(
                icon: Icons.location_on_outlined,
                label: 'Khu vực',
                onPressed: () {},
                textColor: Colors.black,
              ),
              BottomAppBarButton(
                icon: Icons.filter_alt_outlined,
                label: 'Bộ lọc',
                onPressed: () {},
                textColor: Colors.black,
              ),
              BottomAppBarButton(
                icon: Icons.swap_vert,
                label: 'Sắp xếp',
                onPressed: () {},
                textColor: Colors.black,
              ),
              BottomAppBarButton(
                icon: Icons.map,
                label: 'Bản đồ',
                onPressed: () {},
                color: AppColors.primaryColor,
                textColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                // var city = dataHotel[index];
                var hotels = selectedCityData['hotels'];
                // print(selectedCityData['hotels']);
                // print(hotels);
                return InkWell(
                  onTap: () {
                    Get.toNamed('/detail_hotel');
                  },
                  child: Column(
                    children: hotels == null || hotels.isEmpty
                        ? [
                            const Center(
                              child: Text(
                                'Rất tiếc không có khách sạn nào gần đây',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]
                        : hotels!.map<Widget>((hotel) {
                            RxList<String> images = RxList<String>(
                                hotel['images']?.cast<String>() ?? []);
                            var hotelName = hotel['hotelName'];
                            var rating = hotel['rating'];
                            var distance = hotel['distance'];
                            var amenities = hotel['amenities'];
                            var bookings = hotel['bookings'];
                            var pricePerNight = hotel['pricePerNight'];
                            var availableRooms = hotel['availableRooms'];
                            // print('images $images');

                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Column(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: 200,
                                        width: double.infinity,
                                        child: Obx( 
                                            () => ImageSlider(
                                                imageUrls: images.value)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(hotelName,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              StarRating(
                                                  rating: rating,
                                                  starColor:
                                                      AppColors.primaryColor,
                                                  starSize: 12),
                                            ],
                                          ),
                                          Row(children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      4, 2, 4, 2),
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  16),
                                                          topRight:
                                                              Radius.circular(
                                                                  16),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  16)),
                                                  color:
                                                      AppColors.purpleCustoms),
                                              child: Text(
                                                '$rating/5',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('Tốt',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color:
                                                        AppColors.purpleCustoms,
                                                    fontSize: 16)),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Expanded(
                                              child: Text('12 Bình luận',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textTitleColor,
                                                      fontSize: 14)),
                                            )
                                          ]),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                size: 14,
                                                color: AppColors.textTitleColor,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Cách $distance km từ trung tâm thành phố',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .textTitleColor),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  children: amenities
                                                      .map<Widget>(
                                                          (String amenity) {
                                                    return InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .listTitleColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                8, 2, 8, 2),
                                                        child: IntrinsicWidth(
                                                          child: Text(
                                                            amenity,
                                                            style: const TextStyle(
                                                                color: AppColors
                                                                    .textTitleColor,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.thumb_up_off_alt,
                                                size: 14,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${bookings.toString()}K+ khách đã đặt',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Expanded(
                                                child: Text(
                                                    'Giá  1 đêm đã bao gồm thuế ',
                                                    textAlign: TextAlign.end,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: AppColors
                                                            .textTitleColor)),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                  '\$${pricePerNight.toStringAsFixed(2)}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              if (availableRooms != null)
                                                Text(
                                                  'Chỉ còn $availableRooms phòng',
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
