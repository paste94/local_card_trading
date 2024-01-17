part of 'selected_card_bloc.dart';

class SelectedCardState extends Equatable {
  const SelectedCardState({
    this.inputName = '',
    this.selectedCard,
  });

  final String inputName;

  final MtgCard? selectedCard;

  @override
  List<Object?> get props => [
        inputName,
        selectedCard,
      ];

  // Future<SelectedCardState> selectCard(String fullName) {

  //   MtgCard? card;

  //   getCardFromName

  //   return SelectedCardState(

  //     inputName: fullName,

  //     selectedCard: card,

  //   );

  // }

  SelectedCardState copyWith({
    String? inputName,

    // MtgCard? selectedCard,
  }) {
    return SelectedCardState(
      inputName: inputName ?? this.inputName,

      // selectedCard: selectedCard ?? this.selectedCard,
    );
  }
}

final class SelectedCardInitial extends SelectedCardState {}
