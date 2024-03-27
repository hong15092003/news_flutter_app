import 'package:flutter/material.dart';

class Stepper extends ChangeNotifier {
  int _currentStep = 0;
  int get currentStep => _currentStep;

  void next() {
    _currentStep++;
    notifyListeners();
  }

  void previous() {
    _currentStep--;
    notifyListeners();
  }

  set currentStep(int value) {
    _currentStep = value;
    notifyListeners();
  }
}
