import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';

class FlowBuilderStatesWrapper {
  FlowBuilderStatesWrapper({
    required this.navigationState,
    required this.selectedCard,
  });

  NavigationState navigationState;
  MyMtgCard? selectedCard;
}
