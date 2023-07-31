import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morejourneys/cubit/app_cubitstates.dart';

class AppCubits extends Cubit {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());

    //initializing the state of the cubit with IntialState class and then we will
    //emit the WelcomeState class
  }
}
