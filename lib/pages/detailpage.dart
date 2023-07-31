import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morejourneys/cubit/app_cubits.dart';
import 'package:morejourneys/misc/colors.dart';
import 'package:morejourneys/widgets/app_large_text.dart';
import 'package:morejourneys/widgets/app_text.dart';
import 'package:morejourneys/widgets/appbuttons.dart';
import 'package:morejourneys/widgets/responsivebutton.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedindex = -1;
  int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 300,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                ),
                width: MediaQuery.of(context).size.width,
                height: 550,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          color: Colors.black54.withOpacity(0.8),
                        ),
                        AppLargeText(
                            text: "\$ 250", color: AppColors.mainColor),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //location and icon
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: "USA, California",
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //rating stars
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AppText(
                          text: "(4.0)",
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                    //People
                    const SizedBox(
                      height: 25,
                    ),
                    AppLargeText(
                      text: "People",
                      size: 20,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.mainTextColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedindex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: AppButtons(
                              color: selectedindex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectedindex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              size: 60,
                              bordercolor: selectedindex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text:
                          "Yosemito Nationol Pork is located in central Siana Nevada the US state of California. It is located near the wild protected areas.",
                      color: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    size: 60,
                    bordercolor: AppColors.textColor1,
                    icon: Icons.favorite_border,
                    isIcon: true,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ResponsiveButton(
                    responsive: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
