import 'package:flutter/material.dart';
import 'package:memory_game/matcher/bloc/matcher_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/matcher/components/life_display.dart';

class MatcherBoard extends StatefulWidget {
  const MatcherBoard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MatcherBoardState();
}

class MatcherBoardState extends State<MatcherBoard> {
  
  late MatcherBloc matcherBloc;

  @override
  void initState() {
    matcherBloc = context.read<MatcherBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatcherBloc, MatcherState>(
      bloc: matcherBloc,
      builder: (_, state) {
        if (state is ActiveGame) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Matcher - ${difficultyMatchers[state.difficulty]}"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                generateControls(state),
                generateGrid(state)
              ],
            ),
          );
        }
        return genericLoadingPage();
      },
    );
  }

  Widget generateControls(ActiveGame state)
  {
    final dropDownMenuItems = <DropdownMenuItem<Difficulty>>[];
    difficultyMatchers.forEach((dificulty, dificultyText) {
      dropDownMenuItems.add(DropdownMenuItem<Difficulty>(
        child: Text(dificultyText),
        value: dificulty,
      ));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton(
          items: dropDownMenuItems,
          value: state.difficulty,
          onChanged: (Difficulty? v) {
            if (v == null) {
              return;
            }
            matcherBloc.add(InitialiseMatcherGameEvent(v));
          },
        ),
        LifeDisplay(
          key: const Key('life-display'),
          lifeCount: state.lives,
          lives: state.maxLives, 
          size: 40
        )
      ],
    );
  }

  Widget generateGrid(ActiveGame activeGame)
  {
    return Table();
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