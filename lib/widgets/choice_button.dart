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
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);

    _controller.forward();

    _controller.addListener(() {
      // print(_controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: MaterialButton(
        onPressed: () {
          widget.passModel.checkAnswer(widget.passModel.k);
        },
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
              widget.passModel.mydata[1][widget.passModel.i.toString()]
                  [widget.passModel.k],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
          ],
        ),
        color: widget.passModel.buttonColor[widget.passModel.k],
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

double _padding = 30.0;

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
//   }