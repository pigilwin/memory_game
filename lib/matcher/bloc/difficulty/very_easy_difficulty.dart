import 'package:memory_game/matcher/bloc/difficulty/abstract_difficulty.dart';

class VeryEasyDifficulty extends AbstractDifficulty {
  VeryEasyDifficulty() : super(
    index: 0, 
    displayText: 'Very Easy', 
    maxLives: 1,
    rows: 2,
    columns: 3
  ); 
}