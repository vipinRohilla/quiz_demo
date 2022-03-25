import 'package:flutter/material.dart';
import 'package:quiz_application/global/global_variables.dart';
import 'package:quiz_application/screens/home_screen.dart';
import 'package:quiz_application/widgets/circular_percent_indicator.dart';
import 'package:quiz_application/widgets/list_view_builder.dart';

class ResultScreen extends StatelessWidget {
  final double marks;
  final List timings;
  const ResultScreen({Key? key, required this.marks, required this.timings})
      : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    // print(marks);
    // print(timings);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 239, 239),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return gradient.createShader(Offset.zero & bounds.size);
                },
                child: const Center(
                  child: Text(
                    "RESULT",
                    style: TextStyle(
                        letterSpacing: 5,
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: 
                // CircularPercentIndicator(
                //     animation: true,
                //     backgroundWidth: 15,
                //     animationDuration: 1000,
                //     linearGradient: const LinearGradient(
                //         colors: [Colors.red, Colors.pink, Colors.purple]),
                //     // rotateLinearGradient: true,
                //     // animateFromLastPercent:  true,

                //     // restartAnimation: true,
                //     center: Text(
                //       (marks * 10 + 1 <= 9)
                //           ? "${(marks) ~/ 1}"
                //           : "${(marks) ~/ 1}",
                //       style: const TextStyle(
                //           fontSize: 50,
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     radius: 85,
                //     lineWidth: 15,
                //     backgroundColor: const Color.fromARGB(255, 233, 232, 232),
                //     circularStrokeCap: CircularStrokeCap.round,
                //     percent: marks / 100),
                MyCircularPercentIndicator(isResultScreen: true, timer: marks,)
              ),
              const SizedBox(
                height: 30,
              ),
              Container(

                decoration:  BoxDecoration(
                  color: stripColor,
                  border: Border(
                    top: BorderSide(
                      color: stripColor,
                      width: 2),
                    bottom: BorderSide(
                      color: stripColor,
                      width: 2),
                  )
                ),
                child: const Center(
                  child: Text("Timings",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize : 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: MyListViewBuilder(
                      timings: timings,
                      startingIndex: 0,
                      )
                        // ListView.builder(
                        //   itemCount: timings.length/2 as int,
                        //   itemBuilder: (context, index) =>
                        //    ListTile(
                        //       title: Text('Question ${index+1}'),
                        //       trailing: Text('${timings[index]*10} sec',
                        //       style: const TextStyle(
                        //         fontWeight: FontWeight.bold
                        //       ),
                        //       ),
                        //   )
                        // ),
              
                        ),
                    SizedBox(
                      height: 100,
                      width: 1,
                      child: Container(
                          color: const Color.fromARGB(255, 224, 223, 223)),
                    ),
                    Expanded(
                        child: MyListViewBuilder(
                      timings: timings,
                      startingIndex: (timings.length~/2)
                    )
                        // ListView.builder(
                        //   itemCount: timings.length/2 as int,
                        //   itemBuilder: (context, index) =>
                        //    ListTile(
                        //       title: Text('Question ${index+6}'),
                        //       trailing: Text('${timings[index+5]*10} sec',
                        //       style: const TextStyle(
                        //         fontWeight: FontWeight.bold
                        //       ),
                        //       ),
                        //   )
                        // ),
                        ),
                  ],
                ),
              ),
              // const SizedBox(height: 100,),
              Divider(
                thickness: 1,
                color: stripColor
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 233, 231, 231))),
                  onPressed: () {
                    setMarks = 0;
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                    navigateToTheOtherScreen(context, HomeScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return gradient.createShader(Offset.zero & bounds.size);
                      },
                      child: const Text(
                        "Go back to the Quiz",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 40,
              )
            ]

            // Text('$marks'),
            ),
      ),
    );
  }
}
