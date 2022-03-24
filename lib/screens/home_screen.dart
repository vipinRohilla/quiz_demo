import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_application/widgets/custom_card.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController controller;
  final List _topics = ["python", "science", "javascript", "c++"];

  @override
  void initState() {
    super.initState();
    // controller = VideoPlayerController.asset("assets/75.mp4")..initialize().then((_){
    //   controller.setLooping(true);
    //   Timer(const Duration(milliseconds: 100), () {
    //     setState(() {
    //       controller.play();
    //     });
    //   });
    // });
    
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("QUIZ APP"),
        automaticallyImplyLeading: false,
        elevation: 0.2,
      ),
      body: Stack(
        children : 
        [
          // VideoPlayer(controller),
        // ListView(
          // children: [
            //customCard("python", context),
            //customCard("science", context),
            //customCard("javascript", context),
           //customCard("C++", context),
          //   ],
          // children: 
          ListView.builder(
            itemCount: _topics.length,
            itemBuilder: (context, i){
              return customCard(_topics[i], context);
            }
            ),
        // ),
        ]
      ),
    );
  }
}
