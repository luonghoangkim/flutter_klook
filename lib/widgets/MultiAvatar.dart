import 'package:flutter/material.dart';

class MultiAvatar extends StatelessWidget {
  final List<String> avatarUrls;

  MultiAvatar({required this.avatarUrls});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0, // Khoảng cách giữa các hình đại diện
      runSpacing: 0,
      children: avatarUrls.map((url) => buildAvatar(url)).toList(),
    );
  }

  Widget buildAvatar(String url) {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
      radius: 10.0, // Đặt kích thước của hình đại diện
    );
  }
}
