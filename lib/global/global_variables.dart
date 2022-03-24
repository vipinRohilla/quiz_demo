  import 'package:flutter/material.dart';
  
  Color colorToShow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;

  int marks = 0;
  int i = 1;
  double timer = 0.0;
  String showTimer = "0.1";
  Color white = Colors.white;

   Map<String, Color> buttonColor = {
    'a': white,
    'b': white,
    'c': white,
    'd': white,
  };
  bool cancelTimer = false;

  List options = ["a", "b", "c", "d"];
  List optionsColors = [
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.red,
  ];