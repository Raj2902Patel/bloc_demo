import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  final int value;
  const CounterState({required this.value});

  @override
  List<Object> get props => [value];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(value: 0);
}

class CounterIncrementState extends CounterState {
  const CounterIncrementState(int newValue) : super(value: newValue);
}

class CounterDecrementState extends CounterState {
  const CounterDecrementState(int newValue) : super(value: newValue);
}
