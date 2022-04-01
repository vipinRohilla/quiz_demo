import 'package:flutter/material.dart';

class ChoiceButtonModel {
  String k;
  Color color;
  List mydata;
  Function checkAnswer;
  int currentQuestion;
  Map<String, dynamic> buttonColor;

  ChoiceButtonModel(
      {required this.k,
      required this.color,
      required this.mydata,
      required this.checkAnswer,
      required this.currentQuestion,
      required this.buttonColor});
}
