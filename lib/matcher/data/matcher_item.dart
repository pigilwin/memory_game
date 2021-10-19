import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MatcherItem extends Equatable {
  final Color color;
  final Point point;
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