import "package:equatable/equatable.dart";
import "package:morejourneys/models/datamodel.dart";

abstract class CubitState extends Equatable {}

//every cubut class must have initial state,
//and the initial state must extend the cubit state
//this state gets triggered automatically

//after this, welcome state gets triggered
class InitialState extends CubitState {
  @override
  //[] should consist of the data that has to be changed.
  //this page is not doing any change in data

  //so if the data is changed anywhere in the app then
  //cubit will automatically track the change and rebuild the UI
  List<Object> get props => [];
}

//ones thats done, we need to trigger our main welcomepage which
//will be done by creating a new state called WelcomeState

class WelcomeState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitState {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailState extends CubitState {
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}
