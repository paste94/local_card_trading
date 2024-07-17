// ignore_for_file: constant_identifier_names
import 'package:scryfall_api/scryfall_api.dart';

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
