import 'package:apptest/widgets/button_rep%C3%B3nive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              const Text('Ấn Button để vào screen khách sạn'),
              ReponsiveButton(
                width: 100,
                onPressed: () {
                  Get.toNamed('/hotel');
                },
              ),
              SizedBox(
                height: 10,
              ),
              const Text('Ấn Button để vào test rest api screen'),
              ReponsiveButton(
                width: 100,
                onPressed: () {
                  Get.toNamed('/detail');
                },
              ),
              SizedBox(
                height: 10,
              ),
              ReponsiveButton(
                width: 100,
                onPressed: () {
                  Get.toNamed('/scroll');
                },
              ),
              ReponsiveButton(
                width: 100,
                onPressed: () {
                  Get.toNamed('/Binh');
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
