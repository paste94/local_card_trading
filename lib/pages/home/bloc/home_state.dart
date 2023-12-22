part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState._({
    required this.selectedPage,
    this.isPicDetailsSelected = false,
  });

  final SelectedPage selectedPage;
  final bool isPicDetailsSelected;

  const HomeState.selectPage(SelectedPage selectedPage)
      : this._(selectedPage: selectedPage);

  HomeState copyWith({
    SelectedPage? selectedPage,
    bool? isPicDetailsSelected,
  }) {
    return HomeState._(
      selectedPage: selectedPage ?? this.selectedPage,
      isPicDetailsSelected: isPicDetailsSelected ?? this.isPicDetailsSelected,
    );
  }

  @override
  List<Object> get props => [
        selectedPage,
        isPicDetailsSelected,
      ];
}
