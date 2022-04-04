import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz_application/screens/quiz_screen.dart';

class GetJson extends StatelessWidget {
  final String myJson;
  const GetJson({Key? key, required this.myJson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/$myJson.json'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(child: Text('error fetch'));
        }

        List mydata = json.decode(snapshot.data.toString());
        return QuizScreen(mydata: mydata);
      },
    );
  }
}
