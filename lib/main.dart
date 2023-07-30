import "package:flutter/material.dart";
import "package:morejourneys/pages/welcome_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My App",
      home: Scaffold(
        body: WelcomePage(),
      ),
    );
  }
}
