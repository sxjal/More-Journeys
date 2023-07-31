// ignore_for_file: unused_import

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:morejourneys/cubit/app_cubit_logics.dart";
import "package:morejourneys/cubit/app_cubits.dart";
import "package:morejourneys/pages/detailpage.dart";
import "package:morejourneys/pages/navpages/mainpage.dart";
import "package:morejourneys/pages/welcome_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: Scaffold(
        body: BlocProvider<AppCubits>(
          create: (context) => AppCubits(),
          child: AppCubitLogics(),
        ),
      ),
    );
  }
}
