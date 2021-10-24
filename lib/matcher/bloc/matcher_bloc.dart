import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:memory_game/matcher/data/difficulty/abstract_difficulty.dart';
import 'package:memory_game/matcher/data/difficulty/difficulty_loader.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';

part 'matcher_event.dart';
part 'matcher_state.dart';

class MatcherBloc extends Bloc<MatcherEvent, MatcherState> {
  
  static const List<MaterialColor> colors = [
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
    on<InitialiseMatcherGameEvent>((event, emit) async {
      
      emit(MatcherLoading());

      final difficulties = DifficultyLoader.difficulties;
      final difficulty = difficulties[event.difficultyIndex];
      final items = generateItems(difficulty);

      //Emit a brand new active game state
      emit(ActiveGame(
        difficulty: difficulty, 
        items: items,
        lives: difficulty.maxLives,
        showing: true
      ));

      await Future.delayed(const Duration(seconds: 5), () {
        emit(ActiveGame(
          difficulty: difficulty, 
          items: items,
          lives: difficulty.maxLives,
          showing: false
        ));
      });
    });

    on<CheckPointsEvent>((event, emit) {
      final activeGame = (state as ActiveGame);

      final itemOne = activeGame.items.firstWhere((element) => element.index == event.one);
      final itemTwo = activeGame.items.firstWhere((element) => element.index == event.two);

      /// If the colors don't match then check what needs to be done
      if (itemOne.color != itemTwo.color) {

        final newLivesCount = activeGame.lives - 1;

        /// If we have no lives then fail the game
        if (newLivesCount == 0) {
          emit(FailedGame(difficulty: activeGame.difficulty));
          return;
        }

        emit(ActiveGame(
          difficulty: activeGame.difficulty,
          items: activeGame.items,
          lives: newLivesCount,
          showing: false
        ));
        return;
      }

      final items = MatcherItem.markAsFound(activeGame.items, [event.one, event.two]);

      /// If all items have been found then
      if (items.where((item) => !item.found).isEmpty) {
        emit(CompletedGame(difficulty: activeGame.difficulty, lives: activeGame.lives));
        return;
      }

      /// Reload the game screen with the two points hidden
      emit(ActiveGame(
        difficulty: activeGame.difficulty,
        lives: activeGame.lives,
        items: items, 
        showing: false
      ));
    });
  }

  List<MatcherItem> generateItems(AbstractDifficulty difficulty) {
    
    final colorsShuffled = List<MaterialColor>.from(colors);
    colorsShuffled.shuffle();

    final colorsWithShade = <Color>[];
    
    for (MaterialColor color in colorsShuffled){
      colorsWithShade.add(color);
      colorsWithShade.add(color.shade900);
    }

    ///
    /// Each of the squares is only going to contain half the amount of colors as 
    /// there are cell count 
    ///
    final requiredColors = difficulty.amount ~/ 2;
    
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
    var index = 0;

    for (Color color in duplicatedColors) {
      items.add(MatcherItem(
        color: color,
        found: false,
        index: index
      ));
      index++;
    }

    return items;
  }
}
