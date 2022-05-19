import 'package:flutter/material.dart';
import 'dart:math';
import 'input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const resultTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
);
String male;
const maleAvIcon = Icon(
  FontAwesomeIcons.male,
  size: 45,
  color: Color(0xFFa4ebf3),
);
const femaleAvIcon = Icon(
  FontAwesomeIcons.female,
  size: 45,
  color: Color(0xFFffaec0),
);

class CalculatorBrain {
  CalculatorBrain(
      {this.height, this.weight, this.gender, this.age, this.activity});
  double _bmi;
  double _bmr;
  double _cal;
  final int height;
  final int weight;
  GenderT gender;
  final int age;
  final String activity;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String calculateBMR() {
    if (gender == GenderT.male) {
      _bmr = 10 * weight + 6.25 * height - 5 * age + 5;
      return _bmr.toStringAsFixed(1);
    } else {
      _bmr = 10 * weight + 6.25 * height - 5 * age - 161;
      return _bmr.toStringAsFixed(1);
    }
  }

  String calculateCAL() {
    if (activity == 'SEDENTARY') {
      _cal = _bmr * 1.2;
      return _cal.toStringAsFixed(1);
    } else if (activity == 'LIGHTLY ACTIVE') {
      _cal = _bmr * 1.375;
      return _cal.toStringAsFixed(1);
    } else if (activity == 'MODERATELY ACTIVE') {
      _cal = _bmr * 1.55;
      return _cal.toStringAsFixed(1);
    } else if (activity == 'VERY ACTIVE') {
      _cal = _bmr * 1.725;
      return _cal.toStringAsFixed(1);
    } else if (activity == 'EXTRA ACTIVE') {
      _cal = _bmr * 1.9;
      return _cal.toStringAsFixed(1);
    }
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getComment() {
    if (_bmi >= 25) {
      return 'You have higher than a normal body weight.Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Awesome!';
    } else {
      return 'You have a  lower than a normal body weight. Sana evde yemek vermiyorlar mı ?';
    }
  }

  Color colorPicker() {
    if (_bmi >= 25) {
      return Color(0xFFbe0000);
    } else if (_bmi > 18.5) {
      return Color(0xFF54e346);
    } else {
      return Color(0xFF8ac4d0);
    }
  }

  Icon genderIconPicker() {
    if (gender == GenderT.male) {
      return maleAvIcon;
    } else {
      return femaleAvIcon;
    }
  }

  String genderAveragePicker() {
    if (gender == GenderT.male) {
      return 'Average BMR for a man is just over 1,600 calories per day';
    } else {
      return 'Average BMR for a woman is 1,400 calories per day.';
    }
  }
}
