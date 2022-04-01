import 'package:flutter/material.dart';

class MyListViewBuilder extends StatelessWidget {
  final List timings;
  final int startingIndex;
  const MyListViewBuilder({Key? key, required this.timings, required this.startingIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: timings.length / 2 ~/1,
        itemBuilder: (context, index) => ListTile(
              title: Text('Question ${startingIndex + index+1}'),
              trailing: Text(
                '${timings[startingIndex+index] * 10~/1} sec',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ));
  }
}
