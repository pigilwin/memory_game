import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';
import 'package:memory_game/matcher/data/matcher_table.dart';

part 'matcher_event.dart';
part 'matcher_state.dart';

class MatcherBloc extends Bloc<MatcherEvent, MatcherState> {
  MatcherBloc() : super(MatcherInitial()) {
    on<InitialiseMatcherGameEvent>((event, emit) {
      
      emit(MatcherLoading());

      final maxLives = difficultyLives[event.difficulty]!;

      emit(ActiveGame(
        difficulty: event.difficulty, 
        matcherTable: generateTable(event.difficulty),
        maxLives: maxLives,
        lives: maxLives
      ));
    });
  }

  MatcherTable generateTable(Difficulty difficulty) {
    
    int columns = 0;
    int rows = 0;

    switch (difficulty) {
      case Difficulty.veryEasy:
        columns = 3;
        rows = 2;
        break;
      case Difficulty.easy:
        columns = 3;
        rows = 4;
        break;
      case Difficulty.medium:
        columns = 5;
        rows = 4;
        break;
      case Difficulty.hard:
        columns = 6;
        rows = 6;
        break;
      case Difficulty.veryHard:
        columns = 8;
        rows = 6;
        break;
      default:
        throw Exception('Failed to load columns and rows');
    }
    
    final items = <MatcherItem>[];
    for (int rowIndex = 0; rowIndex < rows; rowIndex++) {
      for (int columnIndex = 0; columnIndex < columns; columnIndex++) {
        items.add(MatcherItem(color: Colors.red, found: false, point: Point(rowIndex, columnIndex)));
      }
    }

    return MatcherTable(
      items: items,
      columns: columns,
      rows: rows
    );
  }
}
