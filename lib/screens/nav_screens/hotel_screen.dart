import 'package:apptest/screens/nav_screens/hotel_infor.dart';
import 'package:apptest/screens/nav_screens/search_location_screen.dart';
import 'package:apptest/widgets/bottom_sheet_hotel.dart';
import 'package:apptest/theme/app_color.dart';
import 'package:apptest/widgets/custom_button.dart';
import 'package:apptest/widgets/custon_card_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  RxInt roomCount = 1.obs;
  RxInt adultCount = 2.obs;
  RxInt childrenCount = 0.obs;
  RxString city = 'Thành phố Hồ Chí Minh'.obs;
  RxString country = ''.obs;
  final _calendarFormat = CalendarFormat.month.obs;
  final _focusedDay = DateTime.now().obs;
  final _selectedDay = Rx<DateTime?>(null);
  final _rangeStart = Rx<DateTime?>(null);
  final _rangeEnd = Rx<DateTime?>(null);

  Map<String, dynamic> printAllValues() {
    Map<String, dynamic> searchData = {
      'roomCount': roomCount,
      'adultCount': adultCount,
      'childrenCount': childrenCount,
      'city': city,
      'country': country,
      'rangeStart': _rangeStart,
      'rangeEnd': _rangeEnd,
    };

    return searchData;
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    _selectedDay.value = null;
    _focusedDay.value = focusedDay;
    _rangeStart.value = start;
    _rangeEnd.value = end;
  }

  void _updateRoomCount(bool increment) {
    if (increment) {
      roomCount++;
    } else {
      if (roomCount > 1) {
        roomCount--;
      }
    }
  }

  void _updateAdultCount(bool increment) {
    if (increment) {
      adultCount.value++;
    } else {
      if (adultCount.value > 0) {
        adultCount.value--;
      }
    }
  }

  void _updateChildrenCount(bool increment) {
    if (increment) {
      childrenCount.value++;
    } else {
      if (childrenCount.value > 0) {
        childrenCount.value--;
      }
    }
  }

  void _navigateToSearchPage(BuildContext context) async {
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
   
    if (result != null && result is Map<String, String>) {
      setState(() {
        city.value = result['name']!;
        country.value = result['country']!;
      });
    }
  }

  late final ScrollController _scrollController;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:
            _scrollPosition > 50 ? Colors.white : Colors.transparent,
        title: _scrollPosition > 50
            ? const Center(child: Text('Khách sạn'))
            : null,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before,
              size: 35,
              color: _scrollPosition > 50 ? Colors.black : Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message,
                color: _scrollPosition > 50 ? Colors.black : Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/banner_hotel.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white
                          .withOpacity(0.8),  
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
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
                                  onTap: () {
                                    _navigateToSearchPage(context);
                                  },
                                  child: Card(
                                    color: AppColors.listTitleColor,
                                    child: ListTile(
                                      title: const Text(
                                        'Địa điểm',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.textTitleColor),
                                      ),
                                      subtitle: Obx(() {
                                        return Text(
                                          city.isNotEmpty && country.isNotEmpty
                                              ? '$city, $country'
                                              : 'Thành phố HCM, Việt Nam',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        );
                                      }),
                                      trailing: const Icon(Icons.my_location),
                                    ),
                                  )),
                              InkWell(
                                onTap: () {
                                  bottomSheetDate(context);
                                },
                                child: Obx(() {
                                  String subtitleText = 'Chọn ngày';
                                  int numberOfDays = 0;
                                  if (_rangeStart.value != null &&
                                      _rangeEnd.value != null) {
                                    final startFormatted = DateFormat('dd/MM')
                                        .format(_rangeStart.value!.toLocal());
                                    final endFormatted = DateFormat('dd/MM')
                                        .format(_rangeEnd.value!.toLocal());
                                    subtitleText =
                                        '$startFormatted - $endFormatted';
                                    numberOfDays = _rangeEnd.value!
                                        .difference(_rangeStart.value!)
                                        .inDays;
                                  }
                                  if (numberOfDays > 0) {
                                    subtitleText += ' | $numberOfDays đêm';
                                  }

                                  return Column(
                                    children: [
                                      CustomCardListTitle(
                                        title: 'Ngày Nhận/Trả Phòng',
                                        subtitle: subtitleText,
                                      ),
                                    ],
                                  );
                                }),
                              ),
                              InkWell(
                                onTap: () {
                                  bottomSheetRoom(context);
                                },
                                child: Obx(
                                  () => CustomCardListTitle(
                                    title: 'Số lượng Phòng & Khách',
                                    subtitle:
                                        '$adultCount người lớn, $roomCount phòng ${childrenCount > 0 ? ', $childrenCount trẻ em' : ''}',
                                  ),
                                ),
                              ),
                              CustomButton(
                                buttonText: 'Tìm kiếm',
                                onPressed: () {
                                  Map<String, dynamic> searchData =
                                      printAllValues();
                                  print(searchData);
                                  Get.toNamed('/search_hotel',
                                      arguments: searchData);
                                },
                              )
                            ],
                          ),
                        ),
                        const HotelInfor(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheetRoom(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return RoomSelectionBottomSheet(
          roomCount: roomCount,
          adultCount: adultCount,
          childrenCount: childrenCount,
          updateRoomCount: _updateRoomCount,
          updateAdultCount: _updateAdultCount,
          updateChildrenCount: _updateChildrenCount,
        );
      },
    );
  }

  Future<dynamic> bottomSheetDate(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return CalendarWidget(
          calendarFormat: _calendarFormat,
          focusedDay: _focusedDay,
          rangeStart: _rangeStart,
          rangeEnd: _rangeEnd,
          onRangeSelected: _onRangeSelected,
          onFormatChanged: (format) {
            if (_calendarFormat.value != format) {
              _calendarFormat.value = format;
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay.value = focusedDay;
          },
        );
      },
    );
  }
}
