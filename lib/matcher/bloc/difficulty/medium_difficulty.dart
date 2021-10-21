import 'package:memory_game/matcher/bloc/difficulty/abstract_difficulty.dart';

class MediumDifficulty extends AbstractDifficulty {
  MediumDifficulty() : super(
    index: 2, 
    displayText: 'Medium', 
    maxLives: 4,
    columns: 5,
    rows: 4
  );
}