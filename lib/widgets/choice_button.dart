import 'package:flutter/material.dart';

class ChoiceButton extends StatefulWidget {
  final String k;
  final Color color;
  final List mydata;
  final Function checkAnswer;
  final int i;
  final Map<String, dynamic> buttonColor;

  const ChoiceButton({ 
    Key? key,
    required this.k,
    required this.color,
    required this.mydata,
    required this.checkAnswer,
    required this.i,
    required this.buttonColor,
  }) : super(key: key);

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // curve: Curves.easeIn,
      duration: const Duration(seconds: 5),
      child: Padding(
        padding:  EdgeInsets.all(_padding),
        child: MaterialButton(
          onPressed: () {
            widget.checkAnswer(widget.k);
            },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    widget.k.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Text(
                widget.mydata[1][widget.i.toString()][widget.k],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            ],
          ),
          color: widget.buttonColor[widget.k],
          splashColor: Colors.indigo,
          highlightColor: Colors.indigo[700],
          minWidth: 20.0,
          height: 20.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
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