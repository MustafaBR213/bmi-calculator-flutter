import 'dart:math';

import 'main.dart';

class CalBMI {
  CalBMI({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calucateBMI() {
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'overWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }
  String getInterpration() {
    if (_bmi > 25) {
      return 'You have higher than normal body';
    } else if (_bmi > 18.5) {
      return 'You Have Normal Body';
    } else {
      return 'You have lower than normal body';
    }
  }
}
