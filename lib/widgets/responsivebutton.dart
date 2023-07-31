import 'package:flutter/material.dart';
import 'package:morejourneys/misc/colors.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  //optional, I may or may not pass it.
  //responsive is true if I want to use the same button in another screen but with different size.
  //responsive is false if I want to use the same button in another screen but with the same size.

  //width is the size of the button in the respectiv screen
  ResponsiveButton({super.key, this.width = 120, this.responsive = false});
  double? width;
  bool? responsive;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: responsive! ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: responsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            responsive == true
                ? Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: const Text(
                      "Book Trip Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
            Image.asset("img/button-one.png"),
          ],
        ),
      ),
    );
  }
}
