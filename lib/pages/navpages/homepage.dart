import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morejourneys/misc/colors.dart';
import 'package:morejourneys/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//tickerproviderstatemixing is for the tab bar controller
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List images = [];
  @override
  Widget build(BuildContext context) {
    TabController? _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      //safeAreaview: false,
      body: Column(
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
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
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

          Container(
            //margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: const DecorationImage(
                        image: AssetImage("img/mountain.jpeg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
