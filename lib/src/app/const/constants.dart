// ignore_for_file: constant_identifier_names

import 'package:local_card_trading/src/app/classes/conditions_values.dart';
import 'package:local_card_trading/src/app/enums/conditions_enum.dart';

const ERROR_DISPLAY_SECS = 10;
const CARD_BORDER_RADIUS = 12.0;

/// CARD SIZE SMALL DIMENSIONS
const CARD_WIDTH_S = 150.0;
const CARD_HEIGHT_S = (CARD_WIDTH_S * CARD_HEIGHT_INCH / CARD_WIDTH_INCH) +
    CARD_SIZE_CORRECTION_S;
const CARD_SIZE_CORRECTION_S = 16;
const CARD_BORDER_RADIUS_S = 3.0;

/// CARD SIZE MEDIUM_DIMENSIONS
const CARD_WIDTH_M = 196.0;
const CARD_HEIGHT_M = (CARD_WIDTH_M * CARD_HEIGHT_INCH / CARD_WIDTH_INCH) +
    CARD_SIZE_CORRECTION_M;
const CARD_SIZE_CORRECTION_M = 21;

const CARD_HEIGHT_INCH = 3.5;
const CARD_WIDTH_INCH = 2.5;

const CIRCLE_AVATAR_BUTTON_SIZE = 17.0;
const PADDING = 8.0;

/// CONDITIONS
const M_NAME = 'Mint';
const NM_NAME = 'Near Mint';
const SP_NAME = 'Slightly Played';
const MP_NAME = 'Moderately Played';
const PL_NAME = 'Played';
const PO_NAME = 'Poor';

const M_ICON_PATH = 'assets/conditions/mint.svg';
const NM_ICON_PATH = 'assets/conditions/near_mint.svg';
const SP_ICON_PATH = 'assets/conditions/slightly_played.svg';
const MP_ICON_PATH = 'assets/conditions/moderately_played.svg';
const PL_ICON_PATH = 'assets/conditions/played.svg';
const PO_ICON_PATH = 'assets/conditions/poor.svg';

final conditions = {
  ConditionsEnum.mint: ConditionsValue(
    name: M_NAME,
    iconUri: M_ICON_PATH,
  ),
  ConditionsEnum.nearMint: ConditionsValue(
    name: NM_NAME,
    iconUri: NM_ICON_PATH,
  ),
  ConditionsEnum.slightlyPlayed: ConditionsValue(
    name: SP_NAME,
    iconUri: SP_ICON_PATH,
  ),
  ConditionsEnum.moderatelyPlayed: ConditionsValue(
    name: MP_NAME,
    iconUri: MP_ICON_PATH,
  ),
  ConditionsEnum.played: ConditionsValue(
    name: PL_NAME,
    iconUri: PL_ICON_PATH,
  ),
  ConditionsEnum.poor: ConditionsValue(
    name: PO_NAME,
    iconUri: PO_ICON_PATH,
  ),
};
