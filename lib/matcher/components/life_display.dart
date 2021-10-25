import 'package:flutter/material.dart';

class LifeDisplay extends StatelessWidget {
  
  const LifeDisplay({
    Key? key,
    required this.lifeCount,
    required this.lives,
    required this.size
  }): super(key: key);

  final int lives;
  final int lifeCount;
  final double size;
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 0.0,
        children: List.generate(lives, (int index) => _buildIcon(context, index)),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, int index) {
    final color = Theme.of(context).primaryColor;
    
    if (index >= lifeCount) {
      return Icon(Icons.favorite_border,
        color: color,
        size: size,
      );
    }
    
    return Icon(Icons.favorite,
      color: color,
      size: size,
    );
  }
}