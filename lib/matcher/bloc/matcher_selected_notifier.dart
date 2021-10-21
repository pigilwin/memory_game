import 'dart:math';

import 'package:flutter/material.dart';

class MatcherSelectedNotifier with ChangeNotifier {

  List<Point<int>> selected = [];

  void add(Point<int> first) {
    selected.add(first);
    notifyListeners(); 
  }
}