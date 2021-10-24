import 'package:flutter/material.dart';

class MatcherSelectedNotifier with ChangeNotifier {

  List<int> selected = [];

  void add(int first) {
    selected.add(first);
    notifyListeners(); 
  }
}