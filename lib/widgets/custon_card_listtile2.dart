import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class CustomCardListTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomCardListTitle({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // color: AppColors.listTitleColor,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 12, color: AppColors.textTitleColor),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
