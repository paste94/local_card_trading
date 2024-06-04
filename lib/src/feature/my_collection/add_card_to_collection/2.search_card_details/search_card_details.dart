import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/2.search_card_details/widgets/card_preview.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/2.search_card_details/widgets/set_dropdown.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';

class SearchCardDetails extends ConsumerWidget {
  const SearchCardDetails({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: SearchCardDetails());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedCard = ref.watch(selectedCardProvider);

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
            const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SetDropdown(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CardPreview(),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
