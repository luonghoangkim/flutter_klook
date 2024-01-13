import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  final String rating;
  final String status;

  const RatingRow({
    required this.rating,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            color: AppColors.contentSaleColor,
          ),
          child: Text(
            rating,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          status,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.contentSaleColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
