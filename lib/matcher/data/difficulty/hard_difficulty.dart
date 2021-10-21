import 'package:memory_game/matcher/data/difficulty/abstract_difficulty.dart';

class HardDifficulty extends AbstractDifficulty {
  HardDifficulty() : super(
    index: 3, 
    displayText: 'Hard', 
    maxLives: 5,
    columns: 6,
    rows: 6
  );
}