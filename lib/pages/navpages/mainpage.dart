import 'package:flutter/material.dart';
import 'package:morejourneys/pages/navpages/baritempage.dart';
import 'package:morejourneys/pages/navpages/homepage.dart';
import 'package:morejourneys/pages/navpages/mypage.dart';
import 'package:morejourneys/pages/navpages/searchpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageindex = 0;
  List pages = const [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  void onTap(index) {
    setState(() {
      pageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: pageindex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.black26,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        //elevation: 0,
        //type: BottomNavigationBarType.,
        //backgroundColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Bar"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My"),
        ],
      ),
      body: pages[pageindex],
    );
  }
}
