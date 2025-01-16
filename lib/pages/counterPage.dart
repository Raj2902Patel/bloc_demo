import 'package:bloc_demo/bloc/equatable/counterBloc.dart';
import 'package:bloc_demo/bloc/equatable/counterEvent.dart';
import 'package:bloc_demo/bloc/equatable/counterState.dart';
import 'package:bloc_demo/pages/counterCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.blue.withOpacity(0.3),
            title: const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "CounterPage",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterCubitPage(),
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
          body: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Counter Value is: ",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${state.value}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(CounterIncrementEvent());
                      },
                      child: const Text(
                        "Increment",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(CounterDecrementEvent());
                      },
                      child: const Text(
                        "Decrement",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
