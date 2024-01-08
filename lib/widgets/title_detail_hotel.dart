import 'package:apptest/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTitleRow extends StatelessWidget {
  final String title;

  const CustomTitleRow({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 8, 20),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 20,
          width: 4,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
