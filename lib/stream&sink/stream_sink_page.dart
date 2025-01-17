import 'dart:async';

import 'package:bloc_demo/bloc/controllers/pageTwo.dart';
import 'package:flutter/material.dart';

class StreamSinkPage extends StatefulWidget {
  const StreamSinkPage({super.key});

  @override
  State<StreamSinkPage> createState() => _StreamSinkPageState();
}

class _StreamSinkPageState extends State<StreamSinkPage> {
  StreamController<int> counterStream = StreamController<int>.broadcast();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.blue.withOpacity(0.3),
        title: StreamBuilder(
          stream: counterStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
              );
            } else {
              return const Text("Stream & Sink");
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageTwo(),
                  ),
                );
              },
              icon: const Icon(
                Icons.next_plan_outlined,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: counterStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100.0,
                ),
              );
            } else {
              return const Text(
                "Error!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 100.0,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: () {
          counterStream.sink.add(counter++);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
