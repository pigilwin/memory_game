part of 'matcher_bloc.dart';

abstract class MatcherEvent extends Equatable {
  const MatcherEvent();

  @override
  List<Object> get props => [];
}

class InitialiseMatcherGameEvent extends MatcherEvent {
  final int difficultyIndex;
  const InitialiseMatcherGameEvent(this.difficultyIndex);
}

class CheckPointsEvent extends MatcherEvent {
  final Point<int> one;
  final Point<int> two;
  const CheckPointsEvent(this.one, this.two);
}