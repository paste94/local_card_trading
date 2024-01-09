import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_search_event.dart';
part 'card_search_state.dart';

class CardSearchBloc extends Bloc<CardSearchEvent, CardSearchState> {
  CardSearchBloc() : super(CardSearchInitial()) {
    on<CardSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
