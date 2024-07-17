import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/providers/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/1.search_card_name/widgets/search_view.dart';

class SearchCardName extends ConsumerWidget {
  const SearchCardName({super.key});
  static Page<void> page() => const MaterialPage<void>(child: SearchCardName());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) => {
        if (!canPop) ref.read(navigationProvider.notifier).closeAddCardPage()
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Search Card Name')),
        body: const SearchView(),
      ),
    );
  }
}
