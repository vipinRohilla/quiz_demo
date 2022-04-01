import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class INTERNET with ChangeNotifier{
  bool _hasInternet = false;

  bool get hasInternet => _hasInternet;

  void checkInternetConnectivity() {
      InternetConnectionChecker().onStatusChange.listen((status) {
        final hasInternet = status == InternetConnectionStatus.connected;
        _hasInternet = hasInternet;
          notifyListeners();
    });
  }

}