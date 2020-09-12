import 'dart:math';

class BMIBrain {
  final int height, weight;
  BMIBrain(this.height, this.weight);
  double _bmi;
  String bmiValue() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    if (_bmi >= 25.0) {
      return 'OVER WEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDER WEIGHT';
    }
  }

  String bmiDescribe() {
    if (_bmi >= 25.0) {
      return 'Start doing exercise.';
    } else if (_bmi > 18.5) {
      return 'Good! keep it up';
    } else {
      return 'Your BMI is Low. You should eat more';
    }
  }
}
