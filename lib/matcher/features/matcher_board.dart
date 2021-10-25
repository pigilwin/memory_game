import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:memory_game/matcher/bloc/matcher_bloc.dart';
import 'package:memory_game/matcher/components/active_game_display.dart';
import 'package:memory_game/matcher/components/completed_game_display.dart';
import 'package:memory_game/matcher/components/failed_game_display.dart';

class MatcherBoard extends StatefulWidget {
  const MatcherBoard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MatcherBoardState();
}

class MatcherBoardState extends State<MatcherBoard> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatcherBloc, MatcherState>(
      builder: (_, state) {
        /// If the state is currently active
        if (state is ActiveGame) {
          return ActiveGameDisplay(activeGame: state,);
        }

        if (state is FailedGame) {
          return FailedGameDisplay(failedGame: state,);
        }

        if (state is CompletedGame) {
          return CompletedGameDisplay(completedGame: state,);
        }

        return genericLoadingPage();
      },
    );
  }

  Widget genericLoadingPage() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Loading...'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}