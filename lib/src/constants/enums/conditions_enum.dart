import 'package:local_card_trading/src/constants/constants.dart';

enum Conditions {
  mint(M_NAME, M_ICON_PATH),
  nearMint(NM_NAME, NM_ICON_PATH),
  slightlyPlayed(SP_NAME, SP_ICON_PATH),
  moderatelyPlayed(MP_NAME, MP_ICON_PATH),
  played(PL_NAME, PL_ICON_PATH),
  poor(PO_NAME, PO_ICON_PATH);

  const Conditions(
    this.name,
    this.iconUri,
  );

  final String name;
  final String iconUri;
}
