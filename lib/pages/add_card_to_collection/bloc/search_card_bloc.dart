import 'dart:io';

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
    on<SearchCardCleanError>(_onSearchCardCleanError);
  }

  Future<void> _onInputNameChanged(
    InputNameChanged event,
    Emitter<SearchCardState> emit,
  ) async {
    if (event.inputName.isNotEmpty) {
      try {
        emit(state.copyWith(
          inputName: event.inputName,
          isSearchCardListLoading: true,
        ));
        Iterable<MtgCard> iterable = await api.getCardsFromName(event.inputName)
          ..toList();
        emit(state.copyWith(
          searchCardsList: iterable.toList(),
          isSearchCardListLoading: false,
        ));
      } on CardsProviderConnectionError catch (e) {
        emit(state.copyWith(
          searchCardError: e.message,
          isSearchCardListLoading: false,
        ));
      }
    } else {
      while (state.isSearchCardListLoading) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      emit(state.copyWith(
        inputName: event.inputName,
        searchCardsList: [],
        isSearchCardListLoading: false,
      ));
    }
  }

  Future<void> _onCardSelected(
    CardSelected event,
    Emitter<SearchCardState> emit,
  ) async {
    emit(state.copyWith(isSearchCardListLoading: true));
    Iterable<MtgCard> iterable = await api.getCardsFromName(event.inputName)
      ..toList();
    emit(state.copyWith(
      inputName: event.inputName,
      isInputNameSelected: true,
      isSearchCardListLoading: false,
      searchCardsList: iterable.toList(),
    ));
  }

  Future<void> _onSearchCardCleanError(
    SearchCardCleanError event,
    Emitter<SearchCardState> emit,
  ) async {
    emit(state.copyWith(
      searchCardError: '',
    ));
  }
}
