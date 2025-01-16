import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<double> {
  CalculatorCubit() : super(0);

  void addition(double num1, double num2) {
    emit(num1 + num2);
  }

  void subtraction(double num1, double num2) {
    emit(num1 - num2);
  }

  void multiplication(double num1, double num2) {
    emit(num1 * num2);
  }

  void division(double num1, double num2) {
    if (num2 != 0) {
      emit(num1 / num2);
    } else {
      emit(double.nan);
    }
  }

  void clearResult() {
    emit(0);
  }
}
