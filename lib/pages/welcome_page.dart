import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:morejourneys/cubit/app_cubits.dart";
import "package:morejourneys/misc/colors.dart";
import "package:morejourneys/widgets/app_large_text.dart";
import "package:morejourneys/widgets/app_text.dart";
import "package:morejourneys/widgets/responsivebutton.dart";

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, pageindex) {
          return Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/${images[pageindex]}"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(text: "Trips"),
                      const AppText(text: "Mountain", size: 30),
                      const SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes give you an incredible sense of freedom alone with endurance tests",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                          // width: 200,
                          child: ResponsiveButton(width: 120),
                        ),
                      ),
                    ],
                  ),
                  // const Spacer(),
                  Column(
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.only(top: 2),
                        width: 8,
                        height: index == pageindex ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == pageindex
                              ? AppColors.mainColor
                              : AppColors.mainColor.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
