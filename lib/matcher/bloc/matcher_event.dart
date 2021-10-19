part of 'matcher_bloc.dart';

abstract class MatcherEvent extends Equatable {
  const MatcherEvent();

  @override
  List<Object> get props => [];
}

class InitialiseMatcherGameEvent extends MatcherEvent {

  final Difficulty difficulty;

  const InitialiseMatcherGameEvent(this.difficulty);

}