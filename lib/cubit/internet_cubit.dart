import 'dart:async';
import 'dart:js_util';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState{Intitial, GainedState,LostState}

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? streamSubscription;
  final Connectivity _connectivity = Connectivity();
  InternetCubit():super(InternetState.Intitial){
  StreamSubscription? streamSubscription;
   = _connectivity.onConnectivityChanged.listen((result) {
      if(result== ConnectivityResult.mobile || result==ConnectivityResult.wifi){
        emit(InternetState.GainedState);
      }
      else{
        emit(InternetState.LostState);
      }
      
    })
  }
  
 

  
}