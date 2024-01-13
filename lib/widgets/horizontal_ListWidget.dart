import 'package:flutter/material.dart';
class HorizontalListWidget extends StatelessWidget {
  final List<Widget> children;

  HorizontalListWidget({required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: children.length,
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
    );
  }
}