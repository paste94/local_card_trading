import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_card_trading/pages/home/view/constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.selectPage(SelectedPage.buy)) {
    on<HomePageSelected>(_onHomePageChanged);
    on<AppUserSelectPicDetails>(_onAppUsetSelectPicDetails);
  }

  void _onHomePageChanged(HomePageSelected event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedPage: event.selectedPage));
  }

  void _onAppUsetSelectPicDetails(
    AppUserSelectPicDetails event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(isPicDetailsSelected: event.isSelected));
  }
}
