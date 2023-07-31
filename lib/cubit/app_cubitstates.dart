import "package:equatable/equatable.dart";

abstract class AppCubitState extends Equatable {
  const AppCubitState();
}

//every cubut class must have initial state,
//and the initial state must extend the cubit state
class InitialState extends AppCubitState {
  @override
  List<Object?> get props => [];
}

//ones thats done, we need to trigger our main welcomepage which
//will be done by creating a new state called WelcomeState

class WelcomeState extends AppCubitState {
  @override
  List<Object?> get props => [];
}
