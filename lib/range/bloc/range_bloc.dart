import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'range_event.dart';
part 'range_state.dart';

class RangeBloc extends Bloc<RangeEvent, RangeState> {
  RangeBloc() : super(RangeInitial()) {
    on<RangeEvent>((event, emit) {
      
    });
  }
}
