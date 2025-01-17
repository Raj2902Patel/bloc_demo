import 'package:bloc_demo/bloc/controllers/couterController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final counterBloc = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.blue.withOpacity(0.3),
        title: const Text(
          "PageTwo",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream: counterBloc.countStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                "${snapshot.data}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100.0,
                ),
              );
            } else {
              return const Text(
                "Not Clicked!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100.0,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.Increment);
            },
            child: const Text(
              "+",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.Decrement);
            },
            child: const Text(
              "-",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.Reset);
            },
            child: const Icon(CupertinoIcons.refresh),
          ),
        ],
      ),
    );
  }
}
