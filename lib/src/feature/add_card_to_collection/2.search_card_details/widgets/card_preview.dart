import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/models/my_mtg_card.dart';
import 'package:local_card_trading/src/constants/constants.dart';
import 'package:local_card_trading/src/widgets/images/mtg_card_image_viewer.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/selected_card_provider.dart';

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
