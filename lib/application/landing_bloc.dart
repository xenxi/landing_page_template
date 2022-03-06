import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingState.initial()) {
    on<LandingEvent>((event, emit) {
      if (event is PageChanged) {
        emit(state.copyWith(viewIndex: event.pageIndex));
      }
    });
  }
}
