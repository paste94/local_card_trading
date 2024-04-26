import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';

class SelectedCardPage extends ConsumerWidget {
  const SelectedCardPage({super.key});
  static Page<void> page() =>
      const MaterialPage<void>(child: SelectedCardPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedCard = ref.watch(selectedCardNameProvider);
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (!canPop) ref.read(selectedCardNameProvider.notifier).unselect();
      },
      child: Scaffold(
        appBar: AppBar(title: Text(ref.watch(selectedCardNameProvider) ?? '')),
        body: Column(children: [
          // Text(selectedCard?.setName ?? ''),
        ]),
      ),
    );
  }
}
