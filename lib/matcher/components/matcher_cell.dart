import 'package:flutter/material.dart';
import 'package:memory_game/matcher/data/matcher_item.dart';

enum CellState {
  showing,
  hidden,
  ready
}

class MatcherCell extends StatefulWidget {
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
  _MatcherCellState createState() => _MatcherCellState();

}

class _MatcherCellState extends State<MatcherCell> {

  @override
  Widget build(BuildContext context) {
    
    if (widget.showing == CellState.hidden) {
      return createSquare(context);
    }
    
    return GestureDetector(
      onTap: () {
        widget.callback();
      },
      child: createSquare(context),
    );
  }

  Color fetchColor(BuildContext context) {
    
    if (widget.showing == CellState.showing) {
      return widget.matcherItem.color;
    }

    if (widget.showing == CellState.hidden) {
      return Theme.of(context).scaffoldBackgroundColor;
    }

    return Colors.black;
  }

  Widget createSquare(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: fetchColor(context),
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(milliseconds: 30),
      child: Container(),
    );
  }
}