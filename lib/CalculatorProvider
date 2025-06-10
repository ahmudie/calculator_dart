import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _equation = "0";
  String _result = "0";

  String get equation => _equation;
  String get result => _result;

  void handleInput(String input) {
    if (input == "AC") {
      _equation = "0";
      _result = "0";
    } else if (input == "⌫") {
      if (_equation.length > 1) {
        _equation = _equation.substring(0, _equation.length - 1);
      } else {
        _equation = "0";
      }
    } else if (input == "+/-") {
      if (_equation.startsWith('-')) {
        _equation = _equation.substring(1);
      } else {
        _equation = '-$_equation';
      }
    } else if (input == "=") {
      _calculateResult();
    } else {
      if (_equation == "0") {
        _equation = input;
      } else {
        _equation += input;
      }
    }

    notifyListeners();
  }

  void _calculateResult() {
    try {
      String expression = _equation.replaceAll('×', '*').replaceAll('÷', '/');

      Parser p = Parser();
      Expression exp = p.parse(expression);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      _result = _formatResult(eval);
    } catch (e) {
      _result = "Error";
    }
  }

  String _formatResult(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString(); // z. B. 8.0 → 8
    } else {
      return value.toString();        // z. B. 8.5 → 8.5
    }
  }
}