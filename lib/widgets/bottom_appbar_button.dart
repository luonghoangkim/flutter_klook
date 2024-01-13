import 'package:flutter/material.dart';

class BottomAppBarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const BottomAppBarButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color = Colors.black,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 14,
                  color: color,
                ),
                const SizedBox(width: 4.0),
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: color),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
