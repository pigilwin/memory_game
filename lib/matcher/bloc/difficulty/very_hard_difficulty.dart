import 'package:memory_game/matcher/bloc/difficulty/abstract_difficulty.dart';

class VeryHardDifficulty extends AbstractDifficulty {
  VeryHardDifficulty() : super(
    index: 4, 
    displayText: 'Very Hard', 
    maxLives: 6,
    columns: 8,
    rows: 6
  );
}