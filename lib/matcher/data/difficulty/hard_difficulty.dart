import 'package:memory_game/matcher/data/difficulty/abstract_difficulty.dart';

class HardDifficulty extends AbstractDifficulty {
  HardDifficulty() : super(
    index: 3, 
    displayText: 'Hard', 
    maxLives: 5,
    amount: 20,
    crossAxisCount: 4
  );
}