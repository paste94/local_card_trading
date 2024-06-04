import 'package:local_card_trading/src/app/enums/conditions_enum.dart';
import 'package:scryfall_api/scryfall_api.dart';

// TODO: Considera l'idea di creare una classe che contiene l'ID della carta e le info addizionali a parte

class MyMtgCard extends MtgCard {
  ConditionsEnum condition;
  bool wannaAddToMyCollection;

  MyMtgCard({
    super.arenaId,
    required super.id,
    required super.lang,
    super.mtgoId,
    super.mtgoFoilId,
    super.multiverseIds,
    super.tcgplayerId,
    super.tcgplyerEtchedId,
    super.cardmarketId,
    required super.oracleId,
    required super.printsSearchUri,
    required super.rulingsUri,
    required super.scryfallUri,
    required super.uri,
    super.allParts,
    super.cardFaces,
    required super.cmc,
    required super.colorIdentity,
    super.colorIndicator,
    super.colors,
    super.edhrecRank,
    super.handModifier,
    required super.keywords,
    required super.layout,
    required super.legalities,
    super.lifeModifier,
    super.loyalty,
    super.manaCost,
    required super.name,
    super.oracleText,
    required super.oversized,
    super.power,
    super.producedMana,
    required super.reserved,
    super.toughness,
    required super.typeLine,
    super.artist,
    super.artistIds,
    required super.booster,
    required super.borderColor,
    required super.cardBackId,
    required super.collectorNumber,
    required super.contentWarning,
    required super.digital,
    required super.foil,
    required super.nonfoil,
    required super.finishes,
    super.flavorName,
    super.flavorText,
    super.frameEffects,
    required super.frame,
    required super.fullArt,
    required super.games,
    required super.highresImage,
    super.illustrationId,
    required super.imageStatus,
    super.imageUris,
    required super.prices,
    super.printedName,
    super.printedText,
    super.printedTypeLine,
    required super.promo,
    super.promoType,
    required super.purchaseUris,
    required super.rarity,
    required super.relatedUris,
    required super.releasedAt,
    required super.reprint,
    required super.scryfallSetUri,
    required super.setName,
    required super.setSearchUri,
    required super.setType,
    required super.setUri,
    required super.set,
    required super.setId,
    required super.storySpotlight,
    required super.textless,
    required super.variation,
    super.variationOf,
    super.securityStamp,
    super.watermark,
    super.preview,
    this.condition = ConditionsEnum.mint,
    this.wannaAddToMyCollection = false,
  });

  void toggleWannaAddToMyCollection() {
    wannaAddToMyCollection = !wannaAddToMyCollection;
  }

  factory MyMtgCard.fromMtgCard({
    required MtgCard card,
  }) =>
      MyMtgCard(
        arenaId: card.arenaId,
        id: card.id,
        lang: card.lang,
        mtgoId: card.mtgoId,
        mtgoFoilId: card.mtgoFoilId,
        multiverseIds: card.multiverseIds,
        tcgplayerId: card.tcgplayerId,
        tcgplyerEtchedId: card.tcgplyerEtchedId,
        cardmarketId: card.cardmarketId,
        oracleId: card.oracleId,
        printsSearchUri: card.printsSearchUri,
        rulingsUri: card.rulingsUri,
        scryfallUri: card.scryfallUri,
        uri: card.uri,
        allParts: card.allParts,
        cardFaces: card.cardFaces,
        cmc: card.cmc,
        colorIdentity: card.colorIdentity,
        colorIndicator: card.colorIndicator,
        colors: card.colors,
        edhrecRank: card.edhrecRank,
        handModifier: card.handModifier,
        keywords: card.keywords,
        layout: card.layout,
        legalities: card.legalities,
        lifeModifier: card.lifeModifier,
        loyalty: card.loyalty,
        manaCost: card.manaCost,
        name: card.name,
        oracleText: card.oracleText,
        oversized: card.oversized,
        power: card.power,
        producedMana: card.producedMana,
        reserved: card.reserved,
        toughness: card.toughness,
        typeLine: card.typeLine,
        artist: card.artist,
        artistIds: card.artistIds,
        booster: card.booster,
        borderColor: card.borderColor,
        cardBackId: card.cardBackId,
        collectorNumber: card.collectorNumber,
        contentWarning: card.contentWarning,
        digital: card.digital,
        foil: card.foil,
        nonfoil: card.nonfoil,
        finishes: card.finishes,
        flavorName: card.flavorName,
        flavorText: card.flavorText,
        frameEffects: card.frameEffects,
        frame: card.frame,
        fullArt: card.fullArt,
        games: card.games,
        highresImage: card.highresImage,
        illustrationId: card.illustrationId,
        imageStatus: card.imageStatus,
        imageUris: card.imageUris,
        prices: card.prices,
        printedName: card.printedName,
        printedText: card.printedText,
        printedTypeLine: card.printedTypeLine,
        promo: card.promo,
        promoType: card.promoType,
        purchaseUris: card.purchaseUris,
        rarity: card.rarity,
        relatedUris: card.relatedUris,
        releasedAt: card.releasedAt,
        reprint: card.reprint,
        scryfallSetUri: card.scryfallSetUri,
        setName: card.setName,
        setSearchUri: card.setSearchUri,
        setType: card.setType,
        setUri: card.setUri,
        set: card.set,
        setId: card.setId,
        storySpotlight: card.storySpotlight,
        textless: card.textless,
        variation: card.variation,
        variationOf: card.variationOf,
        securityStamp: card.securityStamp,
        watermark: card.watermark,
        preview: card.preview,
        condition: ConditionsEnum.mint,
      );
}
