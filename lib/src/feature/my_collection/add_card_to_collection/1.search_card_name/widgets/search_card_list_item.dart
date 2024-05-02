import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/core/widgets/mtg_card_image_viewer.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';

class SearchCardListItem extends ConsumerStatefulWidget {
  const SearchCardListItem({super.key, required this.myCard});

  final MyMtgCard myCard;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchCardListItemState();
}

class _SearchCardListItemState extends ConsumerState<SearchCardListItem> {
  void selectCard() => ref
      .read(selectedCardNameProvider.notifier)
      .selectName(widget.myCard.name);

  Widget _cardImage() => MtgCardImageViewer(
        myCard: widget.myCard,
        borderRadius: const BorderRadius.all(
          Radius.circular(CARD_BORDER_RADIUS),
        ),
      );

  Widget _cardName() => Padding(
        padding: const EdgeInsets.only(left: PADDING),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(widget.myCard.name),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(CARD_BORDER_RADIUS),
        ),
      ),
      child: Column(
        children: [
          _cardImage(),
          const Divider(color: Colors.transparent),
          _cardName(),
          Row(
            children: <Widget>[
              TextButton(
                onPressed: selectCard,
                child: const Text('Select'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
