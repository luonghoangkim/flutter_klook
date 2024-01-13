import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class ListHotelCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String imagePath;
  final List<String> details;

  const ListHotelCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.imagePath,
    required this.details,
  }) : super(key: key);

  @override
  _ListHotelCardState createState() => _ListHotelCardState();
}

class _ListHotelCardState extends State<ListHotelCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.zoom_out_map, size: 12),
                      const SizedBox(width: 5),
                      Text(
                        widget.subTitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textTitleColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Từ ',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textTitleColor,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: const Icon(
                Icons.arrow_circle_down,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        if (isExpanded)
          Container(
            padding: const EdgeInsets.all(10),
            color: AppColors.listTitleColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.details
                  .map((detail) => Text(
                        detail,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ))
                  .toList(),
            ),
          ),
        const Divider(
          thickness: 0.5,
          color: AppColors.listTitleColor,
        ),
      ],
    );
  }
}
