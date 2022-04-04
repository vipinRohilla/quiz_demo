import 'package:flutter/material.dart';
import 'package:quiz_application/global/single_touch_gesture.dart';

class SingleTouchRecognizerWidget extends StatelessWidget {
  final Widget? child;
  const SingleTouchRecognizerWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        SingleTouchRecognizer: GestureRecognizerFactoryWithHandlers<SingleTouchRecognizer>(
          () => SingleTouchRecognizer(),
          (SingleTouchRecognizer instance) {},
        ),
      },
      child: child,
    );
  }
}
