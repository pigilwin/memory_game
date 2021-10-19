import 'package:equatable/equatable.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';

class MatcherTable extends Equatable {
  
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