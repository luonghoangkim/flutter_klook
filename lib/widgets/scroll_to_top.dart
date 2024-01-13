import 'package:flutter/material.dart';

class ScrollToTopButton extends StatelessWidget {
  final ScrollController controller;

  ScrollToTopButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      child: Container(
        width: 48,
        height: 48,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Icon(Icons.vertical_align_top, size: 24),
      ),
    );
  }
}
