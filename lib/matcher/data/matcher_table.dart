import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';

class MatcherTable extends Equatable {
  
  static MatcherTable markAsFound(MatcherTable current, List<Point<int>> foundPoints) {
    
    final items = List<MatcherItem>.from(current.items);

    for (var point in foundPoints) {
      var itemForPoint = items.firstWhere((element) => element.point == point);

      items.remove(itemForPoint);

      items.add(MatcherItem(
        color: itemForPoint.color,
        found: true,
        point: itemForPoint.point
      ));
    }

    return MatcherTable(
      columns: current.columns,
      rows: current.rows,
      items: items
    );
  }



  final List<MatcherItem> items;
  final int columns;
  final int rows;

  const MatcherTable({
    required this.items, 
    required this.columns, 
    required this.rows
  });

  @override
  List<Object?> get props => [
    items,
    columns,
    rows
  ];
}