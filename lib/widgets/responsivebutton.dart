import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  //optional, I may or may not pass it.
  //responsive is true if I want to use the same button in another screen but with different size.
  //responsive is false if I want to use the same button in another screen but with the same size.

  //width is the size of the button in the respectiv screen
  ResponsiveButton({super.key, this.width, this.responsive});
  double? width;
  bool? responsive;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
