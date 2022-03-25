import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_application/widgets/custom_card.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List _topics = ["python", "science", "javascript", "c++"];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("QUIZ APP"),
        automaticallyImplyLeading: false,
        elevation: 0.2,
      ),
      body: ListView.builder(
          itemCount: _topics.length,
          itemBuilder: (context, index) {
            return CustomCard(languageName: _topics[index], context: context);
            // customCard(_topics[index], context);
          }),
    );
  }
}
