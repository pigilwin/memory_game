import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MatcherItem extends Equatable {
  final Color color;
  final int x;
  final int y;
  final bool found;

  const MatcherItem({
    required this.color,
    required this.found,
    required this.x,
    required this.y
  });

  @override
  List<Object> get props => [
    color,
    x,
    y,
    found
  ];
}