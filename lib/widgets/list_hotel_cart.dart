import 'package:apptest/theme/app_color.dart';
import 'package:flutter/material.dart';

class ListHotelCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String imagePath;
  final List<Map<String, dynamic>> details;

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
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            color: AppColors.whiteColor,
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Row(
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
                      isExpanded
                          ? const Text('')
                          : Row(
                              children: [
                                const Text(
                                  'Từ ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textTitleColor,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    widget.price,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.details
                  .map((roomDetail) => Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${roomDetail['bedType']}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                )
                              ],
                            ),
                            Column(
                              children: (roomDetail['amenities']
                                      as List<Map<String, dynamic>>)
                                  .map(
                                    (amenity) => Row(
                                      children: [
                                        Icon(
                                          amenity['icon'],
                                          size: 14,
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            amenity['name'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.info_outline,
                                            size: 14,
                                            color: AppColors.textTitleColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Flexible(
                                            child: Text(
                                              '${roomDetail['price']}',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        'Giá 1 đêm đã bao gồm thuế',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textTitleColor,
                                        ),
                                      ),
                                      Text(
                                        'Chỉ còn ${roomDetail['availability']} phòng !',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'Đặt ngay',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
