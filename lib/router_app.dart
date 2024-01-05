// router_app.dart
import 'package:apptest/screens/nav_screens/detail_hotel.dart';
import 'package:apptest/screens/nav_screens/search_hotel_screen.dart';
import 'package:apptest/screens/nav_screens/testpage.dart';
import 'package:get/get.dart';
import 'package:apptest/screens/nav_screens/home_screen.dart';
import 'package:apptest/screens/nav_screens/hotel_screen.dart';

class AppRouter {
  static List<GetPage> routes = [
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/hotel', page: () => HotelScreen()),
    GetPage(name: '/search_hotel', page: () => SearchHotelScreen()),
    GetPage(name: '/detail', page: () => DetailScreen()),
    GetPage(name: '/detail_hotel', page: () => DetailHotelScreen()),
  ];
}
