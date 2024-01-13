import 'package:apptest/widgets/serviceItem_Card.dart';
import 'package:apptest/widgets/textWidthIcon.dart';
import 'package:flutter/material.dart';

class ServiceItemList extends StatefulWidget {
  final List<Map<String, String>> dataService;

  ServiceItemList({
    Key? key,
    required this.dataService,
  }) : super(key: key);

  @override
  _ServiceItemListState createState() => _ServiceItemListState();
}

class _ServiceItemListState extends State<ServiceItemList> {
  int visibleItemCount = 3;
  late List<Map<String, String>> displayedItems;

  @override
  void initState() {
    super.initState();
    displayedItems = widget.dataService.take(visibleItemCount).toList();
  }

  void showMore() {
    setState(() {
      visibleItemCount += 3;
      displayedItems = widget.dataService.take(visibleItemCount).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Hiển thị các item
        Column(
          children: displayedItems.map((item) {
            return ServiceItem_Cart(
              title: item['title']!,
              subTitle: item['subTitle']!,
              price: item['price']!,
            );
          }).toList(),
        ),
        if (visibleItemCount < widget.dataService.length)
          InkWell(
            onTap: showMore,
            child: TextWithIcon(
              text: 'Xem thêm các lựa chọn khác',
              iconData: Icons.arrow_drop_down,
              iconPosition: IconPosition.right,
              textStyle: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              iconStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
      ],
    );
  }
}
