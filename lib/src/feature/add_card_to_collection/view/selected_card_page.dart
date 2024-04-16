import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/search_card_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/widgets/search_card_list_item.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/widgets/search_view.dart';
import 'package:scryfall_api/scryfall_api.dart';

class SelectedCardPage extends ConsumerWidget {
  const SelectedCardPage({super.key});
  static Page<void> page() =>
      const MaterialPage<void>(child: SelectedCardPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) =>
          {if (!canPop) ref.read(selectedCardProvider.notifier).unselect()},
      child: Scaffold(
        appBar: AppBar(title: const Text('SELECTED CARD')),
        body: const Text('SELECTED'),
      ),
    );
  }
}
