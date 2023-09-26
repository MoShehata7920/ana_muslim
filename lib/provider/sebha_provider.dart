import 'package:flutter/material.dart';

class SebhaProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void incrementCount() {
    _count++;

    notifyListeners();
  }

  void resetCount() {
    _count = 0;

    notifyListeners();
  }
}
