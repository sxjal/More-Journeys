import 'package:flutter/material.dart';
import 'package:morejourneys/widgets/app_text.dart';

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  AppButtons({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.bordercolor,
    this.text,
    this.icon,
    this.isIcon = false,
  });
  bool? isIcon;
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  final double size;
  final Color bordercolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: bordercolor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: !(isIcon!)
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Icon(icon),
    );
  }
}
