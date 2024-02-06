part of 'my_collection_cubit.dart';

class MyCollectionState extends Equatable {
  const MyCollectionState._({
    this.isSearchPageOpen = false,
    this.searchCardText = '',
  });

  final bool isSearchPageOpen;
  final String searchCardText;

  const MyCollectionState.initialState() : this._();

  MyCollectionState copyWith({
    String? searchCardText,
  }) {
    return MyCollectionState._(
      isSearchPageOpen: searchCardText != '',
      searchCardText: searchCardText ?? this.searchCardText,
    );
  }

  @override
  List<Object> get props => [
        isSearchPageOpen,
        searchCardText,
      ];
}
