import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';

class SetDropdown extends ConsumerWidget {
  const SetDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsList = ref.watch(selectedCardNameProvider);
    final selectedCard = ref.watch(selectedCardProvider);

    var dropdownCardsList = cardsList?.data
        .map((card) => DropdownMenuItem(
              value: card,
              child: Text('${card.setName} #${card.collectorNumber}'),
            ))
        .toList();

    var dropdownSelectedItemBuilder = cardsList?.data
            .map((card) => Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${card.setName} #${card.collectorNumber}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList() ??
        [];

    return Container(
      padding: const EdgeInsets.all(PADDING),
      child: DropdownButton(
        value: selectedCard,
        items: dropdownCardsList,
        onChanged: (card) => ref.read(selectedCardProvider.notifier).set(card),
        isExpanded: true,
        selectedItemBuilder: (context) => dropdownSelectedItemBuilder,
      ),
    );
  }
}
