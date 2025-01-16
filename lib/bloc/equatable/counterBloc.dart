import 'package:bloc_demo/bloc/equatable/counterEvent.dart';
import 'package:bloc_demo/bloc/equatable/counterState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrementEvent>(
      (event, emit) {
        emit(CounterIncrementState(state.value + 1));
      },
    );
    on<CounterDecrementEvent>(
      (event, emit) {
        emit(CounterDecrementState(state.value - 1));
      },
    );
  }
}
