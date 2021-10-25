import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:memory_game/matcher/bloc/matcher_bloc.dart';
import 'package:memory_game/matcher/components/difficulty_selector.dart';

class CompletedGameDisplay extends StatelessWidget {

  final CompletedGame completedGame;

  const CompletedGameDisplay({Key? key, required this.completedGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Matcher Completed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Lives remaining with ${completedGame.lives}"),
            const Text('Select a new game'),
            DifficultySelector(
              onChange: (int index) {
                context.read().add(InitialiseMatcherGameEvent(index));
              },
              difficulty: completedGame.difficulty,
            )
          ],
        ),
      ),
    );
  }
}