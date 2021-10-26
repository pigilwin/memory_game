import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:memory_game/matcher/bloc/matcher_bloc.dart';
import 'package:memory_game/matcher/bloc/matcher_selected_notifier.dart';
import 'package:memory_game/matcher/components/difficulty_selector.dart';
import 'package:memory_game/matcher/components/life_display.dart';
import 'package:memory_game/matcher/components/matcher_cell.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';

class ActiveGameDisplay extends StatefulWidget {

  final ActiveGame activeGame;

  const ActiveGameDisplay({Key? key, required this.activeGame}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ActiveGameDisplayState();
}

class _ActiveGameDisplayState extends State<ActiveGameDisplay> {
  
  final MatcherSelectedNotifier matcherSelectedNotifier = MatcherSelectedNotifier();
  late final MatcherBloc matcherBloc;

  @override
  void initState(){

    matcherBloc = context.read<MatcherBloc>();
    
    matcherSelectedNotifier.addListener(() {
      
      if (matcherSelectedNotifier.selected.length != 2) {
        return;
      }

      Future.delayed(const Duration(milliseconds: 140), () {

        final selectedOne = matcherSelectedNotifier.selected.first;
        final selectedTwo = matcherSelectedNotifier.selected.last;

        matcherSelectedNotifier.selected.clear();

        matcherBloc.add(CheckPointsEvent(selectedOne, selectedTwo));
      });
    });

    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Matcher - ${widget.activeGame.difficulty.displayText}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          generateControls(widget.activeGame),
          SizedBox.fromSize(size: const Size.fromHeight(10),),
          Expanded(
            child: generateGrid(widget.activeGame),
          )
        ],
      ),
    );
  }

  Widget generateControls(ActiveGame state) {

    if (state.showing) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DifficultySelector(
          onChange: (int index) {
            context.read<MatcherBloc>().add(InitialiseMatcherGameEvent(index));
          },
          difficulty: state.difficulty,
        ),
        LifeDisplay(
          lifeCount: state.lives,
          lives: state.difficulty.maxLives, 
          size: 40
        )
      ],
    );
  }

  Widget generateGrid(ActiveGame activeGame) {
    return GridView.builder(
      itemCount: activeGame.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: activeGame.difficulty.crossAxisCount,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5
      ), 
      itemBuilder: (_, i) {
        final item = activeGame.items[i];
        return MatcherCell(
          matcherItem: item,
          showing: calculateCellState(item, activeGame.showing),
          callback: () {
            // If the same color already exists then move on
            if (matcherSelectedNotifier.selected.contains(item.index)) {
              return;
            }

            setState(() {
              matcherSelectedNotifier.add(item.index);
            });
          },
        );
      }
    );
  }

  CellState calculateCellState(MatcherItem item, bool showing) {
    if (matcherSelectedNotifier.selected.contains(item.index)) {
      return CellState.showing;
    }

    if (showing) {
      return CellState.showing;
    }

    if (item.found) {
      return CellState.hidden;
    }

    return CellState.ready;
  }
}