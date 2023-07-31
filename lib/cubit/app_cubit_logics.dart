import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morejourneys/cubit/app_cubits.dart';
import 'package:morejourneys/cubit/app_cubitstates.dart';
import 'package:morejourneys/pages/detailpage.dart';
import 'package:morejourneys/pages/navpages/mainpage.dart';
import 'package:morejourneys/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //to notice any changes in the data, bloc builder must have
      //the clases from which it has to track the changes.

      body: BlocBuilder<AppCubits, CubitState>(builder: (context, state) {
        //using this blocbuilder, we will be checking on states.

        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LoadedState) {
          return const MainPage();
        }
        if (state is DetailState) {
          return const DetailPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
