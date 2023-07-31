import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morejourneys/cubit/app_cubits.dart';
import 'package:morejourneys/cubit/app_cubitstates.dart';
import 'package:morejourneys/misc/colors.dart';
import 'package:morejourneys/widgets/app_large_text.dart';
import 'package:morejourneys/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//tickerproviderstatemixing is for the tab bar controller
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //map with key pair values
  //to use them in the app
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController? _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      //safeAreaview: false,
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //menu
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, size: 30, color: Colors.black54),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //discover text
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: const AppLargeText(text: "Discover"),
                ),
                const SizedBox(
                  height: 20,
                ),
                //tab bar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black54,
                      isScrollable: true,
                      //indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 4),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        ),
                      ],
                    ),
                  ),
                ),
                //tab bar view
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: info.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailpage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/" +
                                        info[index].img),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Text("Inspiration"),
                      const Text("Emotions"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppLargeText(text: "Explore more", size: 22),
                      AppText(
                        text: "See all",
                        color: AppColors.textColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              // margin: const EdgeInsets.only(right: 50),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 159, 59, 59),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "img/${images.keys.elementAt(index)}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                child: AppText(
                              text: images.values.elementAt(index),
                              color: AppColors.textColor2,
                            )),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else
            return Container();
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  CircleTabIndicator({required this.color, required this.radius});
  final Color color;
  double radius;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirlcePainter(color: color, radius: radius);
  }
}

class _CirlcePainter extends BoxPainter {
  _CirlcePainter({required this.color, required this.radius});
  final Color color;
  double radius;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleoffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleoffset, radius, paint);
  }
}
