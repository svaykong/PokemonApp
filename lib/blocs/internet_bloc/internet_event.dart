part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class OnConnectedEvent extends InternetEvent {}

class OnNotConnectedEvent extends InternetEvent {}