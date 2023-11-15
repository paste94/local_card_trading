import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_card_trading/pages/home/view/constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.selectPage(SelectedPage.buy)) {
    on<HomePageSelected>(_onHomePageChanged);
  }

  void _onHomePageChanged(HomePageSelected event, Emitter<HomeState> emit) {
    emit(HomeState.selectPage(event.selectedPage));
  }
}
