// router_app.dart
import 'package:get/get.dart';
import 'package:apptest/pages/navpages/home_page.dart';
import 'package:apptest/pages/navpages/hotel_page.dart';

class AppRouter {
  static List<GetPage> routes = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/hotel', page: () => HotelPage()),
  ];
}
