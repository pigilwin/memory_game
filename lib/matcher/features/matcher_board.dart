import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:memory_game/matcher/bloc/matcher_bloc.dart';
import 'package:memory_game/matcher/bloc/matcher_selected_notifier.dart';
import 'package:memory_game/matcher/components/difficulty_selector.dart';
import 'package:memory_game/matcher/components/life_display.dart';
import 'package:memory_game/matcher/components/matcher_cell.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';

class MatcherBoard extends StatefulWidget {
  const MatcherBoard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MatcherBoardState();
}

class MatcherBoardState extends State<MatcherBoard> {
  
  bool showing = true;
  List<Point<int>> selected = [];
  MatcherSelectedNotifier matcherSelectedNotifier = MatcherSelectedNotifier();

  late MatcherBloc matcherBloc;

  @override
  void initState() {
    matcherBloc = context.read<MatcherBloc>();
    resetShowing();

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
    return BlocBuilder<MatcherBloc, MatcherState>(
      bloc: matcherBloc,
      builder: (_, state) {
        if (state is ActiveGame) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Matcher - ${state.difficulty.displayText}"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                generateControls(state),
                Expanded(
                  child: generateGrid(state),
                )
              ],
            ),
          );
        }
        return genericLoadingPage();
      },
    );
  }

  Widget generateControls(ActiveGame state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DifficultySelector(
          onChange: (int index) {
            setState(() {
              resetShowing();
              matcherBloc.add(InitialiseMatcherGameEvent(index));
            });
          },
          difficulty: state.difficulty,
        ),
        LifeDisplay(
          key: const Key('life-display'),
          lifeCount: state.lives,
          lives: state.difficulty.maxLives, 
          size: 40
        )
      ],
    );
  }

  Widget generateGrid(ActiveGame activeGame) {
    final rows = <TableRow>[];
    for (int rowIndex = 0; rowIndex < activeGame.difficulty.rows; rowIndex++) {
      final tableColumns = <TableCell>[];
      for (int columnIndex = 0; columnIndex < activeGame.difficulty.columns; columnIndex++) {
        
        final item = activeGame.items.firstWhere((element) => element.point == Point(rowIndex, columnIndex));

        tableColumns.add(TableCell(
          child: MatcherCell(
            matcherItem: item,
            showing: calculateCellState(item),
            callback: () {
              setState(() {
                matcherSelectedNotifier.add(item.point);
              });
            },
          ),
        ));
      }
      rows.add(TableRow(children: tableColumns));
    }
    return Table(children: rows);
  }

  CellState calculateCellState(MatcherItem item) {
    if (matcherSelectedNotifier.selected.contains(item.point)) {
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

  void resetShowing() async {
    setState(() {
      showing = true;
    });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showing = false;
      });
    });
  }
}