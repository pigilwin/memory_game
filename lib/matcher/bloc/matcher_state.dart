part of 'matcher_bloc.dart';

enum Difficulty { veryEasy, easy, medium, hard, veryHard }

const difficultyMatchers = {
  Difficulty.veryEasy: 'Very Easy',
  Difficulty.easy: 'Easy',
  Difficulty.medium: 'Medium',
  Difficulty.hard: 'Hard',
  Difficulty.veryHard: 'Very Hard'
};

abstract class MatcherState extends Equatable {
  const MatcherState();
  
  @override
  List<Object> get props => [];
}

class MatcherInitial extends MatcherState {}

class MatcherLoading extends MatcherState {}

class ActiveGame extends MatcherState {

  final List<MatcherItem> items;
  final Difficulty difficulty;
   
  const ActiveGame({
    required this.difficulty,
    required this.items
  });

  @override
  List<Object> get props => [items, difficulty];
}