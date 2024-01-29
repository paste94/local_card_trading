part of 'search_card_bloc.dart';

class SearchCardState extends Equatable {
  const SearchCardState({
    this.inputName = '',
    this.isInputNameSelected = false,
    this.selectedCard,
    this.isSearchCardListLoading = false,
    this.searchCardError = '',
    this.searchCardsList = const [],
    this.searchSetsList = const [],
  });

  final String inputName;
  final bool isInputNameSelected;
  final bool isSearchCardListLoading;
  final String searchCardError;

  final MtgCard? selectedCard;
  final List<MtgCard> searchCardsList;
  final List<MtgSet> searchSetsList;

  @override
  List<Object?> get props => [
        inputName,
        isInputNameSelected,
        isSearchCardListLoading,
        selectedCard,
        searchCardsList,
        searchSetsList,
        searchCardError,
      ];

  SearchCardState copyWith({
    String? inputName,
    bool? isInputNameSelected,
    bool? isSearchCardListLoading,
    MtgCard? selectedCard,
    List<MtgCard>? searchCardsList,
    List<MtgSet>? searchSetsList,
    String? searchCardError,
  }) {
    return SearchCardState(
      inputName: inputName ?? this.inputName,
      isInputNameSelected: isInputNameSelected ?? this.isInputNameSelected,
      isSearchCardListLoading:
          isSearchCardListLoading ?? this.isSearchCardListLoading,
      selectedCard: selectedCard ?? this.selectedCard,
      searchCardsList: searchCardsList ?? this.searchCardsList,
      searchSetsList: searchSetsList ?? this.searchSetsList,
      searchCardError: searchCardError ?? this.searchCardError,
    );
  }
}

final class SelectedCardInitial extends SearchCardState {}
