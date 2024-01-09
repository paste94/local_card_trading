part of 'routes_bloc.dart';

enum SelectedPage {
  home,
  addCardToCollection,
}

class RoutesState extends Equatable {
  const RoutesState({
    this.selectedPage = SelectedPage.home,
  });

  final SelectedPage selectedPage;

  @override
  List<Object> get props => [selectedPage];

  RoutesState copyWith({
    SelectedPage? selectedPage,
  }) {
    return RoutesState(
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }
}
