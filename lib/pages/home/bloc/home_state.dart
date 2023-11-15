part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState._({required this.selectedPage});

  final SelectedPage selectedPage;

  const HomeState.selectPage(SelectedPage selectedPage)
      : this._(selectedPage: selectedPage);

  @override
  List<Object> get props => [selectedPage];
}
