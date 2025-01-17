import 'dart:async';

enum CounterAction { Increment, Decrement, Reset }

class CounterController {
  int count = 0;

  //for counter
  final streamController = StreamController<int>();
  StreamSink<int> get countSink => streamController.sink;
  Stream<int> get countStream => streamController.stream;

  //for event
  final eventController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => eventController.sink;
  Stream<CounterAction> get eventStream => eventController.stream;

  CounterController() {
    eventStream.listen((event) {
      if (event == CounterAction.Increment) {
        count++;
        print("Increment Event Called");
      } else if (event == CounterAction.Decrement) {
        count--;
        print("Decrement Event Called");
      } else if (event == CounterAction.Reset) {
        count = 0;
        print("Reset Event Called");
      }
      countSink.add(count);
    });
  }

  void dispose() {
    eventController.close();
    streamController.close();
  }
}
