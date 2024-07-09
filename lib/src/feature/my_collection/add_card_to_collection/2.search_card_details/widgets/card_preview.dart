import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/core/widgets/mtg_card_image_viewer.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';

class CardPreview extends ConsumerWidget {
  const CardPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyMtgCard? selectedCard = ref.watch(selectedCardProvider);

    return Container(
      padding: const EdgeInsets.all(PADDING),
      child: MtgCardImageViewer(
        myCard: selectedCard,
        borderRadius: const BorderRadius.all(
          Radius.circular(CARD_BORDER_RADIUS_S),
        ),
      ),
    );
  }
}
