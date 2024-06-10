import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';

class FoilCheck extends ConsumerWidget {
  const FoilCheck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyMtgCard? selectedCard = ref.watch(selectedCardProvider);

    return Row(
      children: [
        Expanded(
          child: selectedCard!.finishes.length > 1
              ? Text('foil')
              : Text('${selectedCard.finishes[0]}'),
        ),
        Checkbox(
          value: selectedCard.isFoil,
          onChanged: selectedCard.finishes.length > 1
              ? (val) => ref.read(selectedCardProvider.notifier).setFoil(val!)
              : null,
        ),
      ],
    );
  }
}
