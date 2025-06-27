import 'package:flutter/material.dart';

class Countermodel extends ChangeNotifier {
  int _counter = 0;

  int get Counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}
