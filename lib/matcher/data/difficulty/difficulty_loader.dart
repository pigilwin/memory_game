import 'package:memory_game/matcher/data/difficulty/abstract_difficulty.dart';
import 'package:memory_game/matcher/data/difficulty/easy_difficulty.dart';
import 'package:memory_game/matcher/data/difficulty/hard_difficulty.dart';
import 'package:memory_game/matcher/data/difficulty/medium_difficulty.dart';
import 'package:memory_game/matcher/data/difficulty/very_easy_difficulty.dart';
import 'package:memory_game/matcher/data/difficulty/very_hard_difficulty.dart';

class DifficultyLoader {

  static final List<AbstractDifficulty> difficulties = [
    VeryEasyDifficulty(),
    EasyDifficulty(),
    MediumDifficulty(),
    HardDifficulty(),
    VeryHardDifficulty()
  ];
}