import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/classes/selected_card_set.dart';
import 'package:local_card_trading/src/app/enums/conditions_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'selected_card_provider.g.dart';

final apiClient = ScryfallApiClient();

/// This class contains elements of MyMtgCard selected in [SearchCardDetails] page.
///
///
@riverpod
class SelectedCard extends _$SelectedCard {
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
      final cardsList = await apiClient.searchCards(
        '!"$fullName"', // ! used to exact name search
        rollupMode: RollupMode.prints,
        includeMultilingual: true,
      );
      final setList = cardsList.data
          .map((card) {
            var langList = cardsList.data
                .where((c) =>
                    card.set == c.set &&
                    card.collectorNumber == c.collectorNumber)
                .map((c) => c.lang)
                .toSet()
                .toList();

            print('${card.setName} ${card.collectorNumber} $langList');
            return SelectedCardSet(
                name: card.setName,
                collectorNumber: card.collectorNumber,
                code: card.set,
                langList: langList);
          })
          .toSet()
          .toList();

      state = MyMtgCard.fromMtgCard(
        mtgCard: cardsList[0],
        setList: setList,
      );
    } catch (e) {
      if (e is ScryfallException) {
        print('Caught an exception: ${e.details}');
      }
    }
  }

  void setConditions(Conditions conditions) {
    state = state?.copyWith(conditions: conditions);
  }

  void setFinish(Finish val) {
    state = state?.copyWith(finish: val);
  }

  void setSet(SelectedCardSet set) async {
    try {
      var query =
          '!"${state?.name}" set:"${set.code}" cn:"${set.collectorNumber}"';
      print(query);
      final cardsList = await apiClient.searchCards(
        query, // ! used to exact name search
        rollupMode: RollupMode.prints,
      );
      print('****************$cardsList');
      var selectedCard = cardsList[0];
      state = state?.copyWith(
        mtgCard: selectedCard,
        finish: selectedCard.finishes[0],
      );
    } catch (e) {
      if (e is ScryfallException) {
        print('Caught an exception: ${e.details}');
      }
    }
  }

  void unselect() {
    state = null;
  }
}

/// This class is used to store a list of [PaginalbeList] given a full name
///
/// If the name is empty, the list will be null. This object also manages
/// the state of [SearchCardDetails] determining whether it must be shown
/// to the user or not.
///
/// Example of usage:
///
/// ```dart
/// /// Select name
/// ref.read(selectedCardFullNameListProvider.notifier).selectName(cardName)
///
/// /// Unselect name
/// ref.read(selectedCardFullNameListProvider.notifier).unselect()
///
/// /// Read list
/// PaginableList<MyMtgCard>? cardsList = ref.read(selectedCardFullNameListProvider);
///
/// /// Watch list
/// PaginableList<MyMtgCard>? cardsList = ref.watch(selectedCardFullNameListProvider);
/// ```
// @riverpod
// class SelectedCardFullNameList extends _$SelectedCardFullNameList {
//   @override
//   PaginableList<MyMtgCard>? build() {
//     return null;
//   }

//   void selectName(String fullName) async {
//     final cardList = await apiClient.searchCards(
//       '!$fullName', // ! used to exact name search
//       rollupMode: RollupMode.prints,
//       includeMultilingual: true,
//     );
//     state = PaginableList(
//       data: cardList.data
//           .map((mtgCard) => MyMtgCard.fromMtgCard(mtgCard))
//           .toList(),
//       hasMore: true,
//     );
//   }

//   List<String>? getSetList() {
//     return state?.data.map((card) => card.setName).toList();
//   }

//   void unselect() {
//     state = null;
//   }
// }

