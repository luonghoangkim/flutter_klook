import 'package:apptest/pages/navpages/hotel_infor.dart';
import 'package:apptest/widgets/icon_button.dart';
import 'package:apptest/pages/navpages/search_location_page.dart';
import 'package:apptest/widgets/app_color.dart';
import 'package:apptest/widgets/custom_button.dart';
import 'package:apptest/widgets/custon_card_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  RxInt roomCount = 1.obs;
  RxInt adultCount = 2.obs;
  RxInt childrenCount = 0.obs;
  RxString selectedLocation = ''.obs;
  RxString city = ''.obs;
  RxString country = ''.obs;
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
      adultCount++;
    } else {
      if (roomCount > 1) {
        adultCount--;
      }
    }
  }

  void _updateChildrenCount(bool increment) {
    if (increment) {
      childrenCount++;
    } else {
      if (roomCount > 1) {
        childrenCount--;
      }
    }
  }

  void _navigateToSearchPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SearchLocationPage();
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
    print(result);
    if (result != null && result is Map<String, String>) {
      setState(() {
        city.value = result['name']!;
        country.value = result['country']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon:
                        const Icon(Icons.navigate_before, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
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
                                    subtitle: Text(
                                      selectedLocation.isNotEmpty
                                          ? '${city} , ${country}'
                                          : 'Thành phố HCM, Việt Nam',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    trailing: const Icon(Icons.my_location),
                                  ),
                                )),
                            InkWell(
                              onTap: () {
                                bottomSheetDate(context);
                              },
                              child: CustomCardListTitle(
                                title: 'Ngày Nhận/Trả Phòng',
                                subtitle: 'Chọn ngày',
                              ),
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
                              onPressed: () {},
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
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            padding: const EdgeInsets.all(10),
            // Nội dung của bottom sheet ở đây
            child: Column(
              children: [
                const Center(
                    heightFactor: 2,
                    child: Text('Số khách & số phòng',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600))),
                const Divider(),
                ListTile(
                  title: const Text('Phòng',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PlusMinusIconButton(
                        iconData: Icons.remove,
                        onPressed: () {
                          _updateRoomCount(false);
                        },
                      ),
                      Obx(
                        () => Text(
                          '$roomCount',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      PlusMinusIconButton(
                        iconData: Icons.add,
                        onPressed: () {
                          _updateRoomCount(true);
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Người lớn',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PlusMinusIconButton(
                        iconData: Icons.remove,
                        onPressed: () {
                          _updateAdultCount(false);
                        },
                      ),
                      Obx(
                        () => Text('$adultCount',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      PlusMinusIconButton(
                        iconData: Icons.add,
                        onPressed: () {
                          _updateAdultCount(true);
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Trẻ em',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      PlusMinusIconButton(
                        iconData: Icons.remove,
                        onPressed: () {
                          _updateChildrenCount(false);
                        },
                      ),
                      Obx(
                        () => Text('$childrenCount',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      PlusMinusIconButton(
                        iconData: Icons.add,
                        onPressed: () {
                          _updateChildrenCount(true);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      buttonText: 'Xác nhận',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> bottomSheetDate(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Center(
                  heightFactor: 2,
                  child: Text(
                    'Lịch',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(),
                TableCalendar(
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2024, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      buttonText: 'Xác nhận',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
