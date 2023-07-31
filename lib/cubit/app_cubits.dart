import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morejourneys/cubit/app_cubitstates.dart';
import 'package:morejourneys/services/dataservices.dart';

class AppCubits extends Cubit<CubitState> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());

    //initializing the state of the cubit with IntialState class and then we will
    //emit the WelcomeState class

    //void getData() {}
  }

  final DataService data;
  void getData() {
    try {
      emit(LoadingState());
    } catch (e) {
      print(e);
    }
  }
}
