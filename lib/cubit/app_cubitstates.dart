import "package:equatable/equatable.dart";

abstract class CubitState extends Equatable {
  const CubitState();
}

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
