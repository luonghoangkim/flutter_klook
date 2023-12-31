import 'package:flutter/material.dart';

class ReponsiveButton extends StatelessWidget {
  final bool? isReponsive;
  final double? width;
  final VoidCallback? onPressed; // Thêm một tham số callback function

  ReponsiveButton({Key? key, this.isReponsive = false, this.width, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Sử dụng hàm gọi lại khi nút được nhấn
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('img/button-one1.png'),
          ],
        ),
      ),
    );
  }
}
