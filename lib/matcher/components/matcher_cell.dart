import 'package:flutter/material.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';

enum CellState {
  showing,
  hidden,
  ready
}

class MatcherCell extends StatelessWidget {
  const MatcherCell({
    Key? key, 
    required this.matcherItem,
    required this.showing,
    required this.callback
  }) : super(key: key);

  final MatcherItem matcherItem;
  final CellState showing;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: fetchColor()
        ),
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Container(),
      ),
    );
  }

  Color fetchColor() {
    
    if (showing == CellState.showing) {
      return matcherItem.color;
    }

    if (showing == CellState.hidden) {
      return Colors.white;
    }

    return Colors.black;
  }
}