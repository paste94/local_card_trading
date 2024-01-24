part of 'search_card_bloc.dart';

class SearchCardState extends Equatable {
  const SearchCardState({
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

  SearchCardState copyWith({
    String? inputName,
    bool? isInputNameSelected,
    MtgCard? selectedCard,
    List<MtgCard>? searchCardsList,
    List<MtgSet>? searchSetsList,
  }) {
    return SearchCardState(
      inputName: inputName ?? this.inputName,
      isInputNameSelected: isInputNameSelected ?? this.isInputNameSelected,
      selectedCard: selectedCard ?? this.selectedCard,
      searchCardsList: searchCardsList ?? this.searchCardsList,
      searchSetsList: searchSetsList ?? this.searchSetsList,
    );
  }
}

final class SelectedCardInitial extends SearchCardState {}
