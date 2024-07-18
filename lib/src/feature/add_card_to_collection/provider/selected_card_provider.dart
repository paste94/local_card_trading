import 'package:local_card_trading/src/app/models/my_mtg_card.dart';
import 'package:local_card_trading/src/app/models/selected_card_set.dart';
import 'package:local_card_trading/src/constants/enums/conditions_enum.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/selected_card_exception.dart';
import 'package:local_card_trading/src/providers/navigation/navigation_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:db_repository/db_repository.dart';

part 'selected_card_provider.g.dart';

final apiClient = ScryfallApiClient();

/// This class contains elements of MyMtgCard selected in [SearchCardDetails] page.
@riverpod
class SelectedCard extends _$SelectedCard {
  final FirestoreRepository firestoreRepository = FirestoreRepository();

  @override
  MyMtgCard? build() {
    return null;
  }

  void setCard(MtgCard mtgCard) {
    state = state?.copyWith(
      mtgCard: mtgCard,
      finish: mtgCard.finishes[0],
    );
  }

  void setFullName(String fullName) async {
    try {
      /// Gets all cards with [fullName]
      final cardsList = await apiClient.searchCards(
        '!"$fullName"', // ! used to exact name search
        rollupMode: RollupMode.prints,
        includeMultilingual: true,
      );

      /// Gets all sets of [cardsList] with possible languages for each set
      final setList = cardsList.data
          .map((card) => SelectedCardSet(
                name: card.setName,
                collectorNumber: card.collectorNumber,
                code: card.set,
                langList: cardsList.data
                    .where((c) =>
                        card.set == c.set &&
                        card.collectorNumber == c.collectorNumber)
                    .map((c) => c.lang)
                    .toSet()
                    .toList(),
              ))
          .toSet()
          .toList();

      state = MyMtgCard.fromMtgCard(
        mtgCard: cardsList[0],
        setList: setList,
      );
    } catch (e) {
      if (e is ScryfallException) {
        throw SelectedCardException(e.details);
      }
      rethrow;
    }
  }

  void setConditions(Conditions conditions) {
    state = state?.copyWith(conditions: conditions);
  }

  void setFinish(Finish val) {
    state = state?.copyWith(finish: val);
  }

  void setNote(String note) {
    state = state?.copyWith(note: note);
  }

  void setQuantity(int quantity) {
    state = state?.copyWith(quantity: quantity);
  }

  Future<void> setSet(SelectedCardSet set) async {
    try {
      if (set.code != state?.set) {
        /// If the new set does NOT contains the current language,
        /// change it using the head of the list.
        var query = _createQuery(
          set: set.code,
          collectorNumber: set.collectorNumber,
          language: set.langList.contains(state?.lang)
              ? state?.lang.json
              : set.langList[0].json,
        );
        final cardsList = await apiClient.searchCards(
          query, // ! used to exact name search
          rollupMode: RollupMode.prints,
        );
        var newCard = cardsList[0];
        state = state?.copyWith(
          mtgCard: newCard,

          /// If new set haven't the same selected foliage, change it
          finish: newCard.finishes.contains(state?.finish)
              ? state!.finish
              : newCard.finishes[0],
        );
      }
    } catch (e) {
      if (e is ScryfallException) {
        throw SelectedCardException(e.details);
      }
      rethrow;
    }
  }

  void setLanguage(Language language) async {
    try {
      if (language != state!.lang) {
        var query = _createQuery(language: language.json);
        final cardsList = await apiClient.searchCards(
          query, // ! used to exact name search
          rollupMode: RollupMode.prints,
        );
        var newCard = cardsList[0];
        state = state?.copyWith(
          mtgCard: newCard,

          /// If new set haven't the same selected foliage, change it
          finish: newCard.finishes.contains(state!.finish)
              ? state!.finish
              : newCard.finishes[0],
        );
      }
    } catch (e) {
      if (e is ScryfallException) {
        throw SelectedCardException(e.details);
      }
      rethrow;
    }
  }

  void unselect() {
    state = null;
  }

  String _createQuery({
    String? fullName,
    String? set,
    String? collectorNumber,
    String? language,
  }) {
    try {
      fullName = '!"${fullName ?? state!.name}"';
      set = 'set:"${set ?? state!.set}"';
      collectorNumber = 'cn:"${collectorNumber ?? state!.collectorNumber}"';
      language = 'lang:${language ?? state!.lang.json}';
      final query = '$fullName $set $collectorNumber $language';
      return query;
    } catch (e) {
      throw SelectedCardException('[createQuery] State not found, ERROR!');
    }
  }

  Future<void> saveCard() async {
    if (state != null) {
      var firestoreCard = state!.toFirestore();
      firestoreCard['uid'] = ref.read(navigationProvider).user!.id;
      await firestoreRepository.saveCard(firestoreCard);
    }
  }
}
