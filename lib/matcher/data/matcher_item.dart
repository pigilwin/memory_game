import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MatcherItem extends Equatable {
  
  static List<MatcherItem> markAsFound(List<MatcherItem> current, List<int> foundIndexes) {
    
    final items = List<MatcherItem>.from(current);

    for (var index in foundIndexes) {
      var itemForPoint = items.firstWhere((element) => element.index == index);
      items[index] = MatcherItem(
        color: itemForPoint.color,
        found: true,
        index: index
      );
    }

    return items;
  }
  
  final Color color;
  final int index;
  final bool found;

  const MatcherItem({
    required this.color,
    required this.found,
    required this.index,
  });

  @override
  List<Object> get props => [
    color,
    index,
    found
  ];
}