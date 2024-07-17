import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/models/my_mtg_card.dart';
import 'package:local_card_trading/src/constants/constants.dart';
import 'package:local_card_trading/src/widgets/images/mtg_card_image_viewer.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/selected_card_provider.dart';

class SearchCardListItem extends ConsumerStatefulWidget {
  const SearchCardListItem({super.key, required this.myCard});

  final MyMtgCard myCard;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchCardListItemState();
}

class _SearchCardListItemState extends ConsumerState<SearchCardListItem> {
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

  Widget _selectButton() => TextButton(
        onPressed: () {
          try {
            ref
                .read(selectedCardProvider.notifier)
                .setFullName(widget.myCard.name);
          } catch (e) {
            final snackBar = SnackBar(content: Text(e.toString()));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: const Text('Select'),
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
          IntrinsicHeight(
            child: _cardImage(),
          ),
          IntrinsicHeight(
            child: _cardName(),
          ),
          IntrinsicHeight(
            child: _selectButton(),
          ),
        ],
      ),
    );
  }
}
