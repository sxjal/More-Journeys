import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  const AppLargeText({
    super.key,
    this.size = 30,
    required this.text,
    this.color = Colors.black,
  });

  final int size;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.toDouble(),
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
