import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'matcher_event.dart';
part 'matcher_state.dart';

class MatcherBloc extends Bloc<MatcherEvent, MatcherState> {
  MatcherBloc() : super(MatcherInitial()) {
    on<MatcherEvent>((event, emit) {
      
    });
  }
}
