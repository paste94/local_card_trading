import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';

class FlowBuilderStatesWrapper {
  FlowBuilderStatesWrapper({
    required this.navigationState,
    required this.searchCardNameState,
  });

  NavigationState navigationState;
  dynamic searchCardNameState;
}
