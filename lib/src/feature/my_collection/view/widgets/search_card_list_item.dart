import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/app/const/constants.dart';

class SearchCardListItem extends StatefulWidget {
  const SearchCardListItem({super.key, required this.myCard});

  final MyMtgCard myCard;

  @override
  State<SearchCardListItem> createState() => _SearchCardListItemState();
}

class _SearchCardListItemState extends State<SearchCardListItem> {
  int face = 0;

  @override
  Widget build(BuildContext context) {
    late String imageUri;
    bool isSingleSided = widget.myCard.cardFaces?.isEmpty ?? true;

    if (isSingleSided) {
      imageUri = widget.myCard.imageUris?.normal.toString() ?? '';
    } else {
      imageUri =
          widget.myCard.cardFaces![face].imageUris?.normal.toString() ?? '';
    }

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
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(CARD_BORDER_RADIUS),
              topRight: Radius.circular(CARD_BORDER_RADIUS),
            ),
            child: GestureDetector(
              onTap: () => !isSingleSided
                  ? setState(() {
                      face = (face + 1) % 2;
                    })
                  : null,
              child: CachedNetworkImage(
                imageUrl: imageUri,
                progressIndicatorBuilder: (_, __, ___) => const SizedBox(
                  height: 204,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => const SizedBox(
                  height: 204,
                  child: Icon(Icons.image_not_supported),
                ),
              ),
            ),
          ),
          const Divider(
            color: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(widget.myCard.name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Checkbox(
              value: true,
              onChanged: (newVal) {},
            ),
          )
        ],
      ),
    );
  }
}
