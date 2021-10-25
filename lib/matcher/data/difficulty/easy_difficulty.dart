import 'package:memory_game/matcher/data/difficulty/abstract_difficulty.dart';

class EasyDifficulty extends AbstractDifficulty {
  EasyDifficulty() : super(
    index: 1, 
    displayText: 'Easy', 
    maxLives: 3,
    amount: 12,
    crossAxisCount: 4
  ); 
}