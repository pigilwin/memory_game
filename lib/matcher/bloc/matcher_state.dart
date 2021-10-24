part of 'matcher_bloc.dart';
abstract class MatcherState extends Equatable {
  const MatcherState();
  
  @override
  List<Object> get props => [];
}

class MatcherInitial extends MatcherState {}

class MatcherLoading extends MatcherState {}

class ActiveGame extends MatcherState {

  final List<MatcherItem> items;
  final AbstractDifficulty difficulty;
  final int lives;
  final bool showing;
   
  const ActiveGame({
    required this.difficulty,
    required this.items,
    required this.lives,
    required this.showing
  });

  @override
  List<Object> get props => [
    items, 
    difficulty, 
    lives,
    showing
  ];
}

class FailedGame extends MatcherState {
  final AbstractDifficulty difficulty;
  const FailedGame({
    required this.difficulty
  });

  @override
  List<Object> get props => [
    difficulty, 
  ];
}

class CompletedGame extends MatcherState {
  final AbstractDifficulty difficulty;
  final int lives;

  const CompletedGame({
    required this.difficulty,
    required this.lives
  });

  @override
  List<Object> get props => [
    difficulty, 
    lives
  ];
}