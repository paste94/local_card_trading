import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/classes/selected_card_set.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';
import 'package:scryfall_api/scryfall_api.dart';

class SetDropdown extends ConsumerWidget {
  const SetDropdown({super.key});

  void _showError(context, e) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyMtgCard? selectedCard = ref.watch(selectedCardProvider);

    var dropdownCardsList = selectedCard?.setList
        .map((set) => DropdownMenuItem<SelectedCardSet>(
              value: set,
              child: Text(
                '${set.name}, #${set.collectorNumber}',
                overflow: TextOverflow.ellipsis,
              ),
            ))
        .toList();

    return Container(
      padding: const EdgeInsets.all(PADDING),
      child: DropdownButton<SelectedCardSet>(
        value: selectedCard?.selectedSet,
        items: dropdownCardsList,
        onChanged: (set) => ref
            .read(selectedCardProvider.notifier)
            .setSet(set!)
            .catchError((e) => _showError(context, e)),
        isExpanded: true,
      ),
    );
  }
}
