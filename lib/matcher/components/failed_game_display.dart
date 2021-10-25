import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:memory_game/matcher/bloc/matcher_bloc.dart';
import 'package:memory_game/matcher/components/difficulty_selector.dart';

class FailedGameDisplay extends StatelessWidget {
  
  final FailedGame failedGame;

  const FailedGameDisplay({Key? key, required this.failedGame}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Matcher Failed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Select a new game'),
            DifficultySelector(
              onChange: (int index) {
                context.read().add(InitialiseMatcherGameEvent(index));
              },
              difficulty: failedGame.difficulty,
            )
          ],
        ),
      ),
    );
  }
}