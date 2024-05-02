import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/core/widgets/mtg_card_image_viewer.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';
import 'package:scryfall_api/scryfall_api.dart';

class SearchCardDetails extends ConsumerWidget {
  const SearchCardDetails({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: SearchCardDetails());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cardsList = ref.watch(selectedCardNameProvider);
    var selectedCard = ref.watch(selectedCardProvider);

    var dropdownCardsList = cardsList?.data
        .map((card) => DropdownMenuItem(
              value: card,
              child: Row(children: [
                Text('${card.setName} #${card.collectorNumber}'),
              ]),
            ))
        .toList();

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (!canPop) ref.read(selectedCardNameProvider.notifier).unselect();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Add to list')),
        body: Card(
          child: Column(children: [
            Text(selectedCard?.name ?? ''),
            Row(
              children: [
                FractionallySizedBox(
                  widthFactor: 70,
                  child: MtgCardImageViewer(
                    myCard: selectedCard,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(CARD_BORDER_RADIUS_S),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(PADDING),
                  width: CARD_WIDTH_S,
                  child: MtgCardImageViewer(
                    myCard: selectedCard,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(CARD_BORDER_RADIUS_S),
                    ),
                  ),
                ),
                DropdownButton(
                  value: selectedCard,
                  items: dropdownCardsList,
                  onChanged: (card) =>
                      ref.read(selectedCardProvider.notifier).set(card),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
