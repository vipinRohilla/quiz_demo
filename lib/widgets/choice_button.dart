import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_application/model/choice_button_model.dart';

class ChoiceButton extends StatefulWidget {
  // final String k;
  // final Color color;
  // final List mydata;
  // final Function checkAnswer;
  // final int i;
  // final Map<String, dynamic> buttonColor;
  final ChoiceButtonModel passModel;

  const ChoiceButton({Key? key, required this.passModel
      // required this.k,
      // required this.color,
      // required this.mydata,
      // required this.checkAnswer,
      // required this.i,
      // required this.buttonColor,
      })
      : super(key: key);

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton>
    with SingleTickerProviderStateMixin {
      // late bool _loadingInProgress;
  late final String mytext;
  final double _padding = 30.0;
  bool isBack = false;

  // late Animation<double> _angleAnimation;
  // late Animation<double> _scaleAnimation;
  late AnimationController _controller;
  late bool _isButtonDisabled;

  @override
  void initState() {
    super.initState();
    _isButtonDisabled = false;

    _controller =
        AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);


    // _angleAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller)..addListener(() {
    //     setState(() {
          
    //     });
    //   });

    //   _scaleAnimation = Tween(begin: 1.0, end: 6.0).animate(_controller)..addListener(() {
    //     setState(() {
          
    //     });
    //   });
      _controller.addStatusListener((status)async{
        if(status == AnimationStatus.completed){
          // if(_loadingInProgress){
            await _controller.reverse();
            _controller.stop();
          // }
        }
        else if(status == AnimationStatus.dismissed){
          // if(_loadingInProgress){
            _controller.forward();
          // }
        }
      });
    // _controller.forward();

    // _controller.addListener(() {
    //   print(_controller.value);
    // });
  }
  void startAnimation(){
    _controller.forward();
  }

  Color showColor = Colors.white;

  void _checkAnswer(){
    // startAnimation();
    _isButtonDisabled = true;
  widget.passModel.checkAnswer(widget.passModel.k);
  Timer(const Duration(seconds: 1), (() {
    _isButtonDisabled = false;
  }));
  }

  void _doesNothing(){

  }

  
  @override
  Widget build(BuildContext context) {
    // double circleWidth = 10.0 * _scaleAnimation.value;
    // double angleInDegrees = _angleAnimation.value;
    // if(angleInDegrees >= 180){
    //   isBack = true;
    // }else{
    //   isBack = false;
    // }
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: MaterialButton(
        onPressed:
         _isButtonDisabled 
         ? 
         _doesNothing
         :
         _checkAnswer,
         
          // widget.passModel.checkAnswer(widget.passModel.k),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: widget.passModel.color,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  widget.passModel.k.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Text(
              widget.passModel.mydata[1][widget.passModel.currentQuestion.toString()]
                  [widget.passModel.k],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ],
        ),
        color: 
        // Colors.white, 
        widget.passModel.buttonColor[widget.passModel.k],
        // showColor,
        splashColor: Colors.indigo,
        highlightColor: Colors.indigo[700],
        minWidth: 20.0,
        height: 20.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}

// Widget choiceButton(String k, Color color, List mydata, Function checkAnswer, int i, Map<String,dynamic> buttonColor) {
//     return AnimatedContainer(
//       curve: Curves.easeIn,
//       duration: const Duration(milliseconds: 5000),
//       child: Padding(
//         padding:  EdgeInsets.all(_padding),
//         child: MaterialButton(
//           onPressed: () {
//             _padding = 50;
//             checkAnswer(k);
//             },
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                   alignment: Alignment.center,
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     color: color,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Text(
//                     k.toUpperCase(),
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   )),
//               Text(
//                 mydata[1][i.toString()][k],
//                 style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.0),
//               ),
//             ],
//           ),
//           color: buttonColor[k],
//           splashColor: Colors.indigo,
//           highlightColor: Colors.indigo[700],
//           minWidth: 20.0,
//           height: 20.0,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//         ),
//       ),
//     );
