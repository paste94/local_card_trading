// ignore_for_file: constant_identifier_names
import 'package:scryfall_api/scryfall_api.dart';

const ERROR_DISPLAY_SECS = 10;
const CARD_BORDER_RADIUS = 12.0;

/// SETTINGS
const AVATAR_SIZE = 48.0;
const EDIT_AVATAR_IMG_POSITIONED_R = 0.0;
const EDIT_AVATAR_IMG_POSITIONED_T = 60.0;

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

/// NAVIGATION
const FULL_SCREEN_IMAGE_HERO_TAG = 'full_screen_img_hero_tag';
const CARD_IMAGE_TAG = 'card_img_tag';

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

/// FINISHES
const FOIL = 'Foil';
const NONFOIL = 'Non Foil';
const ETCHED = 'Etched Foil';
const GLOSSY = 'Glossy';
const UNKNOWN = 'Unknown';

const Map<Finish, String> finishMap = {
  Finish.foil: FOIL,
  Finish.nonfoil: NONFOIL,
  Finish.etched: ETCHED,
  Finish.glossy: GLOSSY,
  Finish.unknown: UNKNOWN,
};
