import "package:equatable/equatable.dart";

abstract class AppCubitState extends Equatable {
  const AppCubitState();
}

class InitialState extends AppCubitState {
  @override
  List<Object?> get props => [];
}

class WelcomeState extends AppCubitState {
  @override
  List<Object?> get props => [];
}
