import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';
import 'package:scryfall_api/scryfall_api.dart';

class FoilDropdown extends ConsumerWidget {
  const FoilDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyMtgCard? selectedCard = ref.watch(selectedCardProvider);

    var dropdownFinishesList = selectedCard?.finishes
        .map((Finish finish) => DropdownMenuItem(
              value: finish,
              child: Row(
                children: [
                  Text('${finishMap[finish]}'),
                ],
              ),
            ))
        .toList();

    return Container(
      padding: const EdgeInsets.all(PADDING),
      child: DropdownButton<Finish>(
        items: dropdownFinishesList,
        value: selectedCard!.finish,
        onChanged: selectedCard.finishes.length > 1
            ? (value) => ref
                .read(selectedCardProvider.notifier)
                .setFinish(value ?? Finish.unknown)
            : null,
        isExpanded: true,
      ),
    );
  }
}
