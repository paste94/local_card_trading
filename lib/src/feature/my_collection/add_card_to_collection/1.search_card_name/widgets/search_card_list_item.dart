import 'package:cached_network_image/cached_network_image.dart';
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
  // int face = 0;
  // bool isSingleSided = true;

  // void flipCardImage() {
  //   setState(() => face = (face + 1) % 2);
  // }

  void selectCard() {
    ref.read(selectedCardNameProvider.notifier).selectName(widget.myCard.name);
  }

  Widget _cardImage() {
    return MtgCardImageViewer(
      myCard: widget.myCard,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(CARD_BORDER_RADIUS),
        topRight: Radius.circular(CARD_BORDER_RADIUS),
      ),
    );
  }

  Widget _cardName() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(widget.myCard.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // isSingleSided = widget.myCard.cardFaces?[face].imageUris == null;

    // String imageUri =
    //     widget.myCard.cardFaces?[face].imageUris?.normal.toString() ??
    //         widget.myCard.imageUris?.normal.toString() ??
    //         '';

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
              // Visibility(
              //   visible: !isSingleSided,
              //   child: IconButton(
              //     onPressed: flipCardImage,
              //     icon: const Icon(Icons.flip_camera_android),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
