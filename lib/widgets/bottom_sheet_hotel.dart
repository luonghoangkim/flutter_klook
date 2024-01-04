import 'package:apptest/widgets/custom_button.dart';
import 'package:apptest/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class RoomSelectionBottomSheet extends StatelessWidget {
  final RxInt roomCount;
  final RxInt adultCount;
  final RxInt childrenCount;
  final void Function(bool) updateRoomCount;
  final void Function(bool) updateAdultCount;
  final void Function(bool) updateChildrenCount;

  RoomSelectionBottomSheet({
    required this.roomCount,
    required this.adultCount,
    required this.childrenCount,
    required this.updateRoomCount,
    required this.updateAdultCount,
    required this.updateChildrenCount,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Center(
              heightFactor: 2,
              child: Text(
                'Số khách & số phòng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Phòng',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PlusMinusIconButton(
                    iconData: Icons.remove,
                    onPressed: () {
                      updateRoomCount(false);
                    },
                  ),
                  Obx(
                    () => Text(
                      '$roomCount',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  PlusMinusIconButton(
                    iconData: Icons.add,
                    onPressed: () {
                      updateRoomCount(true);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Người lớn',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PlusMinusIconButton(
                    iconData: Icons.remove,
                    onPressed: () {
                      updateAdultCount(false);
                    },
                  ),
                  Obx(
                    () => Text(
                      '$adultCount',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  PlusMinusIconButton(
                    iconData: Icons.add,
                    onPressed: () {
                      updateAdultCount(true);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Trẻ em',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  PlusMinusIconButton(
                    iconData: Icons.remove,
                    onPressed: () {
                      updateChildrenCount(false);
                    },
                  ),
                  Obx(
                    () => Text(
                      '$childrenCount',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  PlusMinusIconButton(
                    iconData: Icons.add,
                    onPressed: () {
                      updateChildrenCount(true);
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
  }
}

class CalendarWidget extends StatelessWidget {
  final Rx<CalendarFormat> calendarFormat;
  final Rx<DateTime> focusedDay;
  final Rx<DateTime?> rangeStart;
  final Rx<DateTime?> rangeEnd;
  final Function(DateTime?, DateTime?, DateTime) onRangeSelected;
  final Function(CalendarFormat) onFormatChanged;
  final Function(DateTime) onPageChanged;

  const CalendarWidget({
    Key? key,
    required this.calendarFormat,
    required this.focusedDay,
    required this.rangeStart,
    required this.rangeEnd,
    required this.onRangeSelected,
    required this.onFormatChanged,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Obx(() {
              return TableCalendar(
                calendarFormat: calendarFormat.value,
                headerVisible: false,
                focusedDay: focusedDay.value,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2024, 12, 31),
                rangeStartDay: rangeStart.value,
                rangeEndDay: rangeEnd.value,
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                ),
                rangeSelectionMode: RangeSelectionMode.toggledOn,
                onRangeSelected: onRangeSelected,
                onFormatChanged: (format) {
                  if (calendarFormat.value != format) {
                    onFormatChanged(format);
                  }
                },
                onPageChanged: onPageChanged,
                rowHeight: 50,
              );
            }),
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
  }
}
