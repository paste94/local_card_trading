import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/2.search_card_details/widgets/card_preview.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/2.search_card_details/widgets/conditions_dropdown.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/2.search_card_details/widgets/foil_dropdown.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/2.search_card_details/widgets/language_dropdown.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/2.search_card_details/widgets/set_dropdown.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/selected_card_provider.dart';

class SearchCardDetails extends ConsumerWidget {
  const SearchCardDetails({super.key});

  static Page<void> page() => const MaterialPage<void>(
        child: SearchCardDetails(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (!canPop) {
          ref.read(selectedCardProvider.notifier).unselect();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add to list'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check),
            )
          ],
        ),
        body: const Card(
          child: Column(
            children: [
              IntrinsicHeight(child: SetDropdown()),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          IntrinsicHeight(child: ConditionsDropdown()),
                          IntrinsicHeight(child: FoilDropdown()),
                          IntrinsicHeight(child: LanguageDropdown()),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CardPreview(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
