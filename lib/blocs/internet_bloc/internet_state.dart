part of 'internet_bloc.dart';

@immutable 
abstract class InternetState {}

class ConnectedInitialState extends InternetState {}

class ConnectedSucessState extends InternetState {}

class ConnectedFailureState extends InternetState {}


