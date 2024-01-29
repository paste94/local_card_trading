part of 'search_card_bloc.dart';

sealed class SearchCardEvent extends Equatable {
  const SearchCardEvent();

  @override
  List<Object> get props => [];
}

final class InputNameChanged extends SearchCardEvent {
  const InputNameChanged(this.inputName);

  final String inputName;
}

final class CardSelected extends SearchCardEvent {
  const CardSelected(this.inputName);

  final String inputName;
}

final class SearchCardCleanError extends SearchCardEvent {
  const SearchCardCleanError();
}
