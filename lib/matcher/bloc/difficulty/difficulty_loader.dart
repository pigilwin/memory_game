import 'package:memory_game/matcher/bloc/difficulty/abstract_difficulty.dart';
import 'package:memory_game/matcher/bloc/difficulty/easy_difficulty.dart';
import 'package:memory_game/matcher/bloc/difficulty/hard_difficulty.dart';
import 'package:memory_game/matcher/bloc/difficulty/medium_difficulty.dart';
import 'package:memory_game/matcher/bloc/difficulty/very_easy_difficulty.dart';
import 'package:memory_game/matcher/bloc/difficulty/very_hard_difficulty.dart';

class DifficultyLoader {

  static final List<AbstractDifficulty> difficulties = [
    VeryEasyDifficulty(),
    EasyDifficulty(),
    MediumDifficulty(),
    HardDifficulty(),
    VeryHardDifficulty()
  ];
}