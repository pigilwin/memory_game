import 'package:memory_game/matcher/data/difficulty/abstract_difficulty.dart';

class VeryEasyDifficulty extends AbstractDifficulty {
  VeryEasyDifficulty() : super(
    index: 0, 
    displayText: 'Very Easy', 
    maxLives: 1,
    amount: 6,
    crossAxisCount: 3
  ); 
}