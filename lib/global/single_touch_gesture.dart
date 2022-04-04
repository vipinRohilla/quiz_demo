import 'package:flutter/gestures.dart';

class SingleTouchRecognizer extends OneSequenceGestureRecognizer {


  int _p = 0;
  @override
  void addAllowedPointer(PointerDownEvent event) {
    //first register the current pointer so that related events will be handled by this recognizer
    startTrackingPointer(event.pointer);
    //ignore event if another event is already in progress
    if (_p == 0) {
      resolve(GestureDisposition.rejected);
      _p = event.pointer;
    } else {
      resolve(GestureDisposition.accepted);
    }
  }
  @override
  String get debugDescription => "";

  @override
  void didStopTrackingLastPointer(int pointer) {

  }

  @override
  void handleEvent(PointerEvent event) {
    if (!event.down && event.pointer == _p) {
      _p = 0;
    }
  }
}