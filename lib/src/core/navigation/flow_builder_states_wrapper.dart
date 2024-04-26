import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/state/search_card_state.dart';

class FlowBuilderStatesWrapper {
  FlowBuilderStatesWrapper({
    required this.navigationState,
    required this.searchCardState,
  });

  NavigationState navigationState;
  MyMtgCard? searchCardState;
}
