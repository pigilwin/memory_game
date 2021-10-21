import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MatcherItem extends Equatable {
  
  static List<MatcherItem> markAsFound(List<MatcherItem> current, List<Point<int>> foundPoints) {
    
    final items = List<MatcherItem>.from(current);

    for (var point in foundPoints) {
      var itemForPoint = items.firstWhere((element) => element.point == point);

      items.remove(itemForPoint);

      items.add(MatcherItem(
        color: itemForPoint.color,
        found: true,
        point: itemForPoint.point
      ));
    }

    return items;
  }
  
  final Color color;
  final Point<int> point;
  final bool found;

  const MatcherItem({
    required this.color,
    required this.found,
    required this.point,
  });

  @override
  List<Object> get props => [
    color,
    point,
    found
  ];
}