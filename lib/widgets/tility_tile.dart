import 'package:apptest/theme/app_color.dart';
import 'package:flutter/material.dart';

class TilityList extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const TilityList({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (data.length / 2).ceil(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemBuilder: (context, rowIndex) {
        final int firstIndex = rowIndex * 2;
        final int secondIndex = firstIndex + 1;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (firstIndex < data.length)
              Expanded(
                child: TilityTile(
                  icon: data[firstIndex]['icon'] as IconData,
                  title: data[firstIndex]['item'] as String,
                ),
              ),
            if (secondIndex < data.length)
              Expanded(
                child: TilityTile(
                  icon: data[secondIndex]['icon'] as IconData,
                  title: data[secondIndex]['item'] as String,
                ),
              ),
          ],
        );
      },
    );
  }
}

class TilityTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const TilityTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.textTitleColor,
            size: 20,
          ),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
