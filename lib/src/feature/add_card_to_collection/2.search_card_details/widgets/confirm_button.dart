import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/selected_card_provider.dart';
import 'package:local_card_trading/src/providers/error.dart';
import 'package:local_card_trading/src/providers/navigation/navigation_provider.dart';

class ConfirmButton extends ConsumerWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        try {
          await ref.read(selectedCardProvider.notifier).saveCard();
          ref.read(selectedCardProvider.notifier).unselect();
          ref.read(navigationProvider.notifier).closeAddCardPage();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Card added'),
              ),
            );
          }
        } catch (e) {
          ref.read(errorProvider.notifier).setError(error: e.toString());
        }
      },
      icon: const Icon(Icons.check),
    );
  }
}
