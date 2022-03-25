import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyCircularPercentIndicator extends StatelessWidget {
  final double timer;
  final bool cancelTimer;
  final bool isResultScreen;
  const MyCircularPercentIndicator({ Key? key, required this.timer, this.cancelTimer = true, required this.isResultScreen }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
                      animation: true,
                      backgroundWidth: isResultScreen ? 15 : 1,
                      animationDuration: isResultScreen ? 1000 : 10000,
                      linearGradient: const LinearGradient(
                          colors: [Colors.red, Colors.pink, Colors.purple]),
                      rotateLinearGradient: true,
                      // animateFromLastPercent:  true,
                      // onAnimationEnd: () => nextQuestion,
                      restartAnimation: true,
                      center: Text(
                        isResultScreen 
                        ? 
                        (timer * 10 + 1 <= 9) ? "${(timer) ~/ 1}" : "${(timer) ~/ 1}"
                        :
                        (timer * 10 + 1 <= 9) ? "0:0${(timer * 10 + 1) ~/ 1}" : "0:${(timer * 10 + 1) ~/ 1}",
                        style: TextStyle(
                            fontSize: isResultScreen ? 50 : 36,
                            color: isResultScreen ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      radius: isResultScreen ? 85 : 75,
                      lineWidth: 15,
                      backgroundColor: const Color.fromARGB(255, 233, 232, 232),
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: 
                      isResultScreen ? timer/100 :
                      cancelTimer ? 0.0 : 1.0);
  }
}

// CircularPercentIndicator(
//                     animation: true,
//                     backgroundWidth: 15,
//                     animationDuration: 1000,
//                     linearGradient: const LinearGradient(
//                         colors: [Colors.red, Colors.pink, Colors.purple]),
//                     // rotateLinearGradient: true,
//                     // animateFromLastPercent:  true,

//                     // restartAnimation: true,
//                     center: Text(
//                       (marks * 10 + 1 <= 9)
//                           ? "${(marks) ~/ 1}"
//                           : "${(marks) ~/ 1}",
//                       style: const TextStyle(
//                           fontSize: 50,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     radius: 85,
//                     lineWidth: 15,
//                     backgroundColor: const Color.fromARGB(255, 233, 232, 232),
//                     circularStrokeCap: CircularStrokeCap.round,
//                     percent: marks / 100),