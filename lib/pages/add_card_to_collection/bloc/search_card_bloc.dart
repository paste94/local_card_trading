import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cards_repository/cards_repository.dart';

part 'search_card_event.dart';
part 'search_card_state.dart';

class SearchCardBloc extends Bloc<SearchCardEvent, SearchCardState> {
  final api = CardsProvider();

  SearchCardBloc() : super(SelectedCardInitial()) {
    on<InputNameChanged>(_onInputNameChanged);
    on<CardSelected>(_onCardSelected);
    on<CardDeselected>(_onCardDeselected);
  }

  Future<void> _onInputNameChanged(
    InputNameChanged event,
    Emitter<SearchCardState> emit,
  ) async {
    emit(state.copyWith(
      inputName: event.inputName,
    ));
  }

  Future<void> _onCardSelected(
    CardSelected event,
    Emitter<SearchCardState> emit,
  ) async {
    Iterable<MtgCard> iterable = await api.getCardsFromName(event.inputName)
      ..toList();
    emit(state.copyWith(
      inputName: event.inputName,
      isInputNameSelected: true,
      searchCardsList: iterable.toList(),
    ));
  }

  Future<void> _onCardDeselected(
    CardDeselected event,
    Emitter<SearchCardState> emit,
  ) async {
    emit(state.copyWith(
      inputName: '',
      isInputNameSelected: false,
      searchSetsList: [],
      searchCardsList: [],
    ));
  }
}
