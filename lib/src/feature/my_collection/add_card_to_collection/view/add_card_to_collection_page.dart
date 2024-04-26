import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/navigation/riverpod/navigation_provider.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/widgets/search_view.dart';

class SearchCard extends ConsumerWidget {
  const SearchCard({super.key});
  static Page<void> page() => const MaterialPage<void>(child: SearchCard());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) => {
        if (!canPop) ref.read(navigationProvider.notifier).closeAddCardPage()
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('ADD CARD')),
        body: const SearchView(),
      ),
    );
  }
}
