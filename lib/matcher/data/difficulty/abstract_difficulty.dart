abstract class AbstractDifficulty {

  final String displayText;
  final int maxLives;
  final int index;
  final int rows;
  final int columns;

  AbstractDifficulty({
    required this.index,
    required this.maxLives,
    required this.displayText,
    required this.columns,
    required this.rows
  });
}