import 'package:apptest/widgets/button_rep%C3%B3nive.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: Text('Trang chủ'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Ấn Button để vào khách sạn'),
            ReponsiveButton(
              width: 100,
              onPressed: () {
                // Thực hiện điều hướng đến HomePage khi nhấn vào button
                Navigator.pushNamed(context, '/hotel');
              },
            ),
            TableCalendar(
              calendarFormat: _calendarFormat,
              headerVisible: false,
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
              ),
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              onRangeSelected: _onRangeSelected,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              rowHeight: 50,
            ),
          ],
        ),
      ),
    );
  }
}
