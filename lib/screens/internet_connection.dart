import 'package:flutter/material.dart';

class InternetConnection extends StatelessWidget {
  const InternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 128, 238),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text(
                "Checking Internet...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
