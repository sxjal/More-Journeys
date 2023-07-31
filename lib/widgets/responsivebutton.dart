import 'package:flutter/material.dart';
import 'package:morejourneys/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  //optional, I may or may not pass it.
  //responsive is true if I want to use the same button in another screen but with different size.
  //responsive is false if I want to use the same button in another screen but with the same size.

  //width is the size of the button in the respectiv screen
  ResponsiveButton({super.key, this.width, this.responsive = false});
  double? width;
  bool? responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (responsive == true) const Text("Book Trip Now"),
          Image.asset("img/button-one.png"),
        ],
      ),
    );
  }
}
