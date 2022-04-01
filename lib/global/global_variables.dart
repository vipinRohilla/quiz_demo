import 'package:flutter/material.dart';


const double endTime = 0.8;
const double increaseTimerByOneSecond = 0.1;
const double decreaseMarksByThree = 3;
const  double lastQuestionIndex = 10;
const double addTenMarks = 10;
const double resetValue = 0.0;

Color colorToShow = Colors.indigoAccent;
Color right = Colors.green;
Color wrong = Colors.red;

double _marks = 0;
double get marks => _marks;
set setMarks(marks) {
  _marks = marks;
}

int currentQuestion = 1;
double timer = 0.0;
String showTimer = "0.0";
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

const gradient = LinearGradient(
  colors: [Colors.red, Colors.pink, Colors.purple],
);

navigateToTheOtherScreen(BuildContext context, myWidget) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => myWidget));
}

Color stripColor = const Color.fromARGB(255, 219, 94, 85);
