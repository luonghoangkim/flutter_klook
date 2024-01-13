import 'package:flutter/material.dart';

class ScrollPositionNotifier with ChangeNotifier {
  double _scrollPosition = 0.0;

  double get scrollPosition => _scrollPosition;

  set scrollPosition(double value) {
    if (_scrollPosition != value) {
      _scrollPosition = value;
      notifyListeners();
    }
  }
}
