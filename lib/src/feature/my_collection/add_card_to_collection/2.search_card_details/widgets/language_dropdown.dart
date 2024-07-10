import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';
import 'package:scryfall_api/scryfall_api.dart';

class LanguageDropdown extends ConsumerWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyMtgCard? selectedCard = ref.watch(selectedCardProvider);
    var langList = selectedCard?.selectedSet?.langList
        .map((lang) => DropdownMenuItem<Language>(
              value: lang,
              child: Text(
                lang.name[0].toUpperCase() + lang.name.substring(1),
                overflow: TextOverflow.ellipsis,
              ),
            ))
        .toList();

    return Container(
      padding: const EdgeInsets.all(PADDING),
      child: DropdownButton<Language>(
        value: selectedCard?.lang,
        items: langList,
        onChanged: langList!.length > 1
            ? (lang) =>
                ref.read(selectedCardProvider.notifier).setLanguage(lang!)
            : null,
        isExpanded: true,
      ),
    );
  }
}
