part of 'selected_card_bloc.dart';

class SelectedCardState extends Equatable {
  const SelectedCardState({
    this.inputName = '',
    this.isInputNameSelected = false,
    this.selectedCard,
    this.searchCardsList = const [],
    this.searchSetsList = const [],
  });

  final String inputName;
  final bool isInputNameSelected;

  final MtgCard? selectedCard;
  final List<MtgCard> searchCardsList;
  final List<MtgSet> searchSetsList;

  @override
  List<Object?> get props => [
        inputName,
        isInputNameSelected,
        selectedCard,
        searchCardsList,
        searchSetsList,
      ];

  SelectedCardState copyWith({
    String? inputName,
    bool? isInputNameSelected,
    MtgCard? selectedCard,
    List<MtgCard>? searchCardsList,
    List<MtgSet>? searchSetsList,
  }) {
    return SelectedCardState(
      inputName: inputName ?? this.inputName,
      isInputNameSelected: isInputNameSelected ?? this.isInputNameSelected,
      selectedCard: selectedCard ?? this.selectedCard,
      searchCardsList: searchCardsList ?? this.searchCardsList,
      searchSetsList: searchSetsList ?? this.searchSetsList,
    );
  }
}

final class SelectedCardInitial extends SelectedCardState {}
