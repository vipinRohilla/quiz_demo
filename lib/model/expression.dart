import 'package:flutter/material.dart';

class ExpressionWidget extends StatelessWidget{
  final String title;
  const ExpressionWidget({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color expressionColor = Colors.white;
    Image expressionImage = Image.asset("");

    switch (title) {
      case "Great":
          expressionColor = Colors.green;
          expressionImage = Image.asset("assets/$title.png");
        break;
      case "Good":
        expressionColor = Colors.yellow;
        expressionImage = Image.asset("assets/$title.png");
        break;
      case "Bad":
        expressionColor = Colors.red;
        expressionImage = Image.asset("assets/$title.png");
        break;  
      default:
    }
    
    return Container(
      height: 80,
      width: double.infinity,
      color: expressionColor,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Center(
          child: Row(
            children: [
              expressionImage,
              Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: title == "Bad" ? 80 : 400,
                ),
              ),
              expressionImage
            ],
          )
          // Text(
          //   title,
          // style: const TextStyle(
          //   // color: Color.fromARGB(255, 231, 230, 230),
          //   fontWeight: FontWeight.bold
          //   ),
          // )
          ),
      ),
    );
  }
}

class ExpressionFactory{
  Widget makeExpression(double marks){

    if(marks >= 70 && marks <= 100){
      return const ExpressionWidget(title : "Great");
    }
    else if(marks >= 40 && marks < 70){
      return const ExpressionWidget(title : "Good");
    }
    return const ExpressionWidget(title : "Bad");
  }
}




