import 'package:memory_game/matcher/data/difficulty/abstract_difficulty.dart';

class VeryHardDifficulty extends AbstractDifficulty {
  VeryHardDifficulty() : super(
    index: 4, 
    displayText: 'Very Hard', 
    maxLives: 6,
    amount: 24,
    crossAxisCount: 5
  );
}