import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';
import 'package:memory_game/matcher/data/matcher_table.dart';

part 'matcher_event.dart';
part 'matcher_state.dart';

class MatcherBloc extends Bloc<MatcherEvent, MatcherState> {
  
  List<MaterialColor> colors = [
    Colors.red,
    Colors.teal,
    Colors.yellow,
    Colors.purple,
    Colors.pink,
    Colors.orange,
    Colors.lime,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.indigo,
    Colors.grey,
    Colors.green,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.cyan,
    Colors.brown,
    Colors.blueGrey,
    Colors.blue,
    Colors.amber
  ];
  
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

    on<CheckPointsEvent>((event, emit) {
      final activeGame = (state as ActiveGame);

      final itemOne = activeGame.matcherTable.items.firstWhere((element) => element.point == event.one);
      final itemTwo = activeGame.matcherTable.items.firstWhere((element) => element.point == event.two);

      if (itemOne.color != itemTwo.color) {

        emit(ActiveGame(
          difficulty: activeGame.difficulty,
          maxLives: activeGame.maxLives,
          matcherTable: activeGame.matcherTable,
          lives: activeGame.lives - 1
        ));
        return;
      }

      emit(ActiveGame(
        difficulty: activeGame.difficulty,
        maxLives: activeGame.maxLives,
        lives: activeGame.lives,
        matcherTable: MatcherTable.markAsFound(activeGame.matcherTable, [event.one, event.two])
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

    final colorsWithShade = <Color>[];
    for (MaterialColor color in colors){
      colorsWithShade.add(color);
      colorsWithShade.add(color.shade900);
    }

    ///
    /// Each of the squares is only going to contain half the amount of colors as 
    /// there are cell count 
    ///
    final requiredColors = (rows * columns) ~/ 2;
    
    ///
    /// From the current colors that we support take the amount of colors we require
    /// and build a new list
    ///
    final currentColors = List<Color>.from(colorsWithShade).take(requiredColors).toList();

    ///
    /// Instead of figuring out some complex logic to store currently used colors
    /// we can add the list back in on itself
    ///
    final duplicatedColors = [currentColors, currentColors].expand((element) => element).toList();
    
    ///
    /// Shuffle the list of the colors to create a some what random
    /// colors generation
    ///
    duplicatedColors.shuffle();
    
    final items = <MatcherItem>[];
    for (int rowIndex = 0; rowIndex < rows; rowIndex++) {
      for (int columnIndex = 0; columnIndex < columns; columnIndex++) {
        items.add(MatcherItem(color: duplicatedColors.removeLast(), found: false, point: Point(rowIndex, columnIndex)));
      }
    }

    return MatcherTable(
      items: items,
      columns: columns,
      rows: rows
    );
  }
}
