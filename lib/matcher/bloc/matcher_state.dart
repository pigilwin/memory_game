part of 'matcher_bloc.dart';

enum Difficulty { veryEasy, easy, medium, hard, veryHard }

const difficultyMatchers = {
  Difficulty.veryEasy: 'Very Easy',
  Difficulty.easy: 'Easy',
  Difficulty.medium: 'Medium',
  Difficulty.hard: 'Hard',
  Difficulty.veryHard: 'Very Hard'
};

const difficultyLives = {
  Difficulty.veryEasy: 1,
  Difficulty.easy: 3,
  Difficulty.medium: 4,
  Difficulty.hard: 5,
  Difficulty.veryHard: 6
};

abstract class MatcherState extends Equatable {
  const MatcherState();
  
  @override
  List<Object> get props => [];
}

class MatcherInitial extends MatcherState {}

class MatcherLoading extends MatcherState {}

class ActiveGame extends MatcherState {

  final MatcherTable matcherTable;
  final Difficulty difficulty;
  final int lives;
  final int maxLives;
   
  const ActiveGame({
    required this.difficulty,
    required this.matcherTable,
    required this.lives,
    required this.maxLives
  });

  @override
  List<Object> get props => [matcherTable, difficulty, lives, maxLives];
}