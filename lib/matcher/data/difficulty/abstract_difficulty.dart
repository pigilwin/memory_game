abstract class AbstractDifficulty {

  final String displayText;
  final int maxLives;
  final int index;
  final int amount;
  final int crossAxisCount;

  AbstractDifficulty({
    required this.index,
    required this.maxLives,
    required this.displayText,
    required this.amount,
    required this.crossAxisCount
  });
}