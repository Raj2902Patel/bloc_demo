import 'package:bloc_demo/bloc/calculator/calculatorCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatelessWidget {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, double>(
      builder: (context, result) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.blue.withOpacity(0.3),
            title: const Text("CalculatorPage"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: num1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Number One",
                      hintText: "eg. 10",
                      prefixIcon: const Icon(CupertinoIcons.number),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: num2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Number Two",
                      hintText: "eg. 20",
                      prefixIcon: const Icon(CupertinoIcons.number),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Answer is: $result",
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            )),
                        onPressed: () {
                          context.read<CalculatorCubit>().addition(
                              double.parse(num1Controller.text),
                              double.tryParse(num2Controller.text) ?? 0);
                          print("Addition Button Pressed");
                        },
                        child: const Text(
                          "Addition",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            )),
                        onPressed: () {
                          context.read<CalculatorCubit>().subtraction(
                              double.parse(num1Controller.text),
                              double.tryParse(num2Controller.text) ?? 0);
                          print("Subtraction Button Pressed");
                        },
                        child: const Text(
                          "Subtraction",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            )),
                        onPressed: () {
                          context.read<CalculatorCubit>().multiplication(
                              double.parse(num1Controller.text),
                              double.tryParse(num2Controller.text) ?? 0);
                          print("Multiplication Button Pressed");
                        },
                        child: const Text(
                          "Multiplication",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            )),
                        onPressed: () {
                          context.read<CalculatorCubit>().division(
                              double.parse(num1Controller.text),
                              double.tryParse(num2Controller.text) ?? 0);
                          print("Division Button Pressed");
                        },
                        child: const Text(
                          "Division",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
