import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:memory_game/matcher/bloc/difficulty/abstract_difficulty.dart';
import 'package:memory_game/matcher/bloc/difficulty/difficulty_loader.dart';

class DifficultySelector extends StatelessWidget {
  
  final AbstractDifficulty difficulty;
  final Function(int index) onChange;

  const DifficultySelector({
    Key? key,
    required this.difficulty,
    required this.onChange
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      items: loadDropdownItems(),
      value: difficulty.index,
      onChanged: (int? v) {
        if (v == null) {
          return;
        }
        onChange(v);
      },
    );  
  }

  List<DropdownMenuItem<int>> loadDropdownItems() {
    final dropDownMenuItems = <DropdownMenuItem<int>>[];
    
    for (AbstractDifficulty difficulty in DifficultyLoader.difficulties) {
      dropDownMenuItems.add(DropdownMenuItem<int>(
        child: Text(difficulty.displayText),
        value: difficulty.index,
      ));
    }

    return dropDownMenuItems;
  }
}