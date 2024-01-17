import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cards_repository/cards_repository.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'selected_card_event.dart';
part 'selected_card_state.dart';

class SelectedCardBloc extends Bloc<SelectedCardEvent, SelectedCardState> {
  final api = CardsProvider();

  final apiClient = ScryfallApiClient();

  SelectedCardBloc() : super(SelectedCardInitial()) {
    on<InputNameChanged>(_onInputNameChanged);
    on<CardSelected>(_onCardSelected);
  }

  Future<void> _onInputNameChanged(
    InputNameChanged event,
    Emitter<SelectedCardState> emit,
  ) async {
    emit(state.copyWith(
      inputName: event.inputName,
    ));
  }

  Future<void> _onCardSelected(
    CardSelected event,
    Emitter<SelectedCardState> emit,
  ) async {
    api.getCardsFromName(event.inputName);
  }
}
