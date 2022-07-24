import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetConnectedBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;

  InternetConnectedBloc() : super(ConnectedInitialState()) {
    // Register event handler: OnConnectedEvent
    on<OnConnectedEvent>((event, emit) => emit(ConnectedSucessState()));

    // Register event handler: OnNotConnectedEvent
    on<OnNotConnectedEvent>((event, emit) => emit(ConnectedFailureState()));

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(OnConnectedEvent());
      } else {
        add(OnNotConnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
