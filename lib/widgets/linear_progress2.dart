import 'package:apptest/widgets/app_color.dart';
import 'package:flutter/material.dart';

class LinerProgress extends StatelessWidget {
  final String label;
  final double rating;

  const LinerProgress({
    Key? key,
    required this.label,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: rating / 5,
                  color: AppColors.primaryColor,  
                  backgroundColor: AppColors.listTitleColor,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                rating.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textTitleColor, 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
