part of 'routes_bloc.dart';

sealed class RoutesEvent extends Equatable {
  const RoutesEvent();

  @override
  List<Object> get props => [];
}

final class GoToAddCardToCollection extends RoutesEvent {
  const GoToAddCardToCollection();
}

final class GoToHome extends RoutesEvent {
  const GoToHome();
}
