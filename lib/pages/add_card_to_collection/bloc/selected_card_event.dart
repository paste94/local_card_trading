part of 'selected_card_bloc.dart';

sealed class SelectedCardEvent extends Equatable {
  const SelectedCardEvent();

  @override
  List<Object> get props => [];
}

final class InputNameChanged extends SelectedCardEvent {
  const InputNameChanged(this.inputName);
  final String inputName;
}

final class CardSelected extends SelectedCardEvent {
  const CardSelected(this.inputName);
  final String inputName;
}

final class CardDeselected extends SelectedCardEvent {
  const CardDeselected();
}
