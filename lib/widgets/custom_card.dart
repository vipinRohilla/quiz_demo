import 'package:flutter/material.dart';
import 'package:quiz_application/screens/add_note.dart';

Widget customCard(String languageName, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AddNote(json : languageName )));
      },
      child: Material(
        elevation: 3.0,
        color: Colors.purple[300],
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              // decoration : const BoxDecoration(gradient: LinearGradient(colors: [Colors.purple,Colors.pink, Colors.purple])),
              color: Colors.purple[300],
              height: 80,
              width: 300,
                child: Center(
                  child: Text(
                    languageName.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  ),
                ),
            ),
          ),
        ]),
      ),
    ),
  );
}