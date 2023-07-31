import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morejourneys/cubit/app_cubitstates.dart';
import 'package:morejourneys/models/datamodel.dart';
import 'package:morejourneys/services/dataservices.dart';

class AppCubits extends Cubit<CubitState> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());

    //initializing the state of the cubit with IntialState class and then we will
    //emit the WelcomeState class

    //void getData() {}
  }

  final DataService data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();

      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  detailpage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
