import 'package:flutter/material.dart';

class ChoiceButtonModel {
  String k;
  Color circularBoxcolor;
  List mydata;
  Function checkAnswer;
  int currentQuestion;
  Map<String, dynamic> buttonColor;

  ChoiceButtonModel(
      {
      required this.k,
      required this.circularBoxcolor,
      required this.mydata,
      required this.checkAnswer,
      required this.currentQuestion,
      required this.buttonColor});
}
