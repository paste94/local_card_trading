import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routes_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc() : super(const RoutesState(selectedPage: SelectedPage.home)) {
    on<GoToAddCardToCollection>(_onGoToAddCardToCollection);
    on<GoToHome>(_onGoToHome);
  }

  void _onGoToAddCardToCollection(
    GoToAddCardToCollection event,
    Emitter<RoutesState> emit,
  ) {
    emit(state.copyWith(selectedPage: SelectedPage.addCardToCollection));
  }

  void _onGoToHome(
    GoToHome event,
    Emitter<RoutesState> emit,
  ) {
    emit(state.copyWith(selectedPage: SelectedPage.home));
  }
}
