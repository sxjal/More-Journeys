import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morejourneys/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//tickerproviderstatemixing is for the tab bar controller
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
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
            child: TabBar(
              controller: _tabController,
              tabs: [
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
          Container(
            child: TabBarView(
              children: [Text("hi"), Text("there"), Text("by")],
            ),
          ),
        ],
      ),
    );
  }
}
