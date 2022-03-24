import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_application/global/global_variables.dart';
import 'package:quiz_application/screens/home_screen.dart';
import 'package:quiz_application/widgets/choice_button.dart';
import 'package:video_player/video_player.dart';

class QuizScreen extends StatefulWidget {
  final mydata;
  const QuizScreen({Key? key, required this.mydata}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late VideoPlayerController controller;


  // final mydata;
  // _QuizScreenState(this.mydata);

 
 void startTimer() async {
    const onesecond = Duration(milliseconds: 1000);

    Timer.periodic(onesecond, (Timer t) {
      if (mounted) {
        setState(() {
          // print(timer.toPrecision(1));
          if (timer.toPrecision(1) > 0.8) {
            t.cancel();
            nextQuestion();
          } else if (cancelTimer) {
            t.cancel();
          } else {
            timer = (timer + 0.1).toPrecision(1);
          }
          showTimer = timer.toString();
        });
      }
    });
  }

  void nextQuestion() {
    cancelTimer = false;
    timer = 0.0;
    if (mounted) {
      setState(() {
        print(colorToShow);
        if(colorToShow == Colors.red){
            i = i;
        }
        else if (i < 5){
          i++;
        } else if(i == 5) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        buttonColor['a'] = Colors.white;
        buttonColor['b'] = Colors.white;
        buttonColor['c'] = Colors.white;
        buttonColor['d'] = Colors.white;
      });
    }
    startTimer();
  }

  void checkAnswer(String k) {
    if (widget.mydata[2]["1"] == widget.mydata[1]["1"][k]) {
      marks = marks + 5;
      colorToShow = right;
    } else {
      colorToShow = wrong;
    }
    if (mounted) {
      setState(() {
        buttonColor[k] = colorToShow;
        cancelTimer = true;
      });
    }
    Timer(const Duration(seconds: 1), nextQuestion);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    controller = VideoPlayerController.asset("assets/74.mp4")..initialize().then((_){
      setState(() {
      });

    });
    controller.setLooping(true);
    controller.play();
  }

  

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "QUIZ APP",
            ),
            content: const Text("You Can't Go Back At This Stage"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"),
              )
            ],
          ),
        );
      },
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Stack(
          children : [
            VideoPlayer(controller),
            Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 3,
                child: Container(
                    padding: const EdgeInsets.all(15.0),
                    alignment: Alignment.center,
                    child: Text(
                      widget.mydata[0][i.toString()],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: CircularPercentIndicator(
                      animation: true,
                      backgroundWidth: 1,
                      animationDuration: 10000,
                      linearGradient: const LinearGradient(
                          colors: [Colors.red, Colors.pink, Colors.purple]),
                      rotateLinearGradient: true,
                      // animateFromLastPercent:  true,
                      // onAnimationEnd: () => nextQuestion,
                      restartAnimation: true,
                      center: Text(
                        "${(timer * 10 + 1) ~/ 1}",
                        style: const TextStyle(
                            fontSize: 36,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      radius: 75,
                      lineWidth: 15,
                      backgroundColor: const Color.fromARGB(255, 233, 232, 232),
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: cancelTimer ? 0.0 : 1.0),
                ),
              ),
              Expanded(
                flex: 11,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
                  itemCount: options.length,
                   itemBuilder: (context, index){
                     return ChoiceButton(k: options[index], color: optionsColors[index], mydata: widget.mydata, checkAnswer: checkAnswer, i: i, buttonColor: buttonColor);
                   })
                
                // GridView(
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2),
                //   // mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                // ChoiceButton(k: 'a', color: Colors.yellow, mydata: mydata, checkAnswer: checkAnswer, i: i, buttonColor: buttonColor),
                // ChoiceButton(k: 'b', color: Colors.blue, mydata: mydata, checkAnswer: checkAnswer, i: i, buttonColor: buttonColor),
                // ChoiceButton(k: 'c', color: Colors.green, mydata: mydata, checkAnswer: checkAnswer, i: i, buttonColor: buttonColor),
                // ChoiceButton(k: 'd', color: Colors.red, mydata: mydata, checkAnswer: checkAnswer, i: i, buttonColor: buttonColor),
                // // choiceButton('a', Colors.yellow, mydata, checkAnswer,i,buttonColor),
                // // choiceButton('b', Colors.blue, mydata, checkAnswer,i,buttonColor),
                // // choiceButton('c', Colors.green, mydata, checkAnswer,i,buttonColor),
                // // choiceButton('d', Colors.red, mydata, checkAnswer,i,buttonColor)
                //   ],
                // ),
              ),
            ],
          ),
          ]
        ),
      ),
    );
  }
}