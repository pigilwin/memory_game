import 'package:memory_game/matcher/data/difficulty/abstract_difficulty.dart';

class EasyDifficulty extends AbstractDifficulty {
  EasyDifficulty() : super(
    index: 1, 
    displayText: 'Easy', 
    maxLives: 3,
    columns: 3,
    rows: 4
  ); 
}