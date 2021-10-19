import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';

part 'matcher_event.dart';
part 'matcher_state.dart';

class MatcherBloc extends Bloc<MatcherEvent, MatcherState> {
  MatcherBloc() : super(MatcherInitial()) {
    on<InitialiseMatcherGameEvent>((event, emit) {
      
      emit(MatcherLoading());

      final items = <MatcherItem>[];
      for (int i = 0; i < 12; i++) {
        items.add(const MatcherItem(color: Colors.red, found: false, x: 0, y: 0));
      }

      final maxLives = difficultyLives[event.difficulty]!;

      emit(ActiveGame(
        difficulty: event.difficulty, 
        items: items,
        maxLives: maxLives,
        lives: maxLives
      ));
    });
  }
}
