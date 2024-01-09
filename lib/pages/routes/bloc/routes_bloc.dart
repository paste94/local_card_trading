import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc() : super(const RoutesState(selectedPage: SelectedPage.home)) {
    on<RoutesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
