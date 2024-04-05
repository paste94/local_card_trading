import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/repository/card/model/mtg_card.dart';
import 'package:local_card_trading/src/repository/card/provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCardToCollection extends ConsumerStatefulWidget {
  const AddCardToCollection({super.key});
  static Page<void> page() =>
      const MaterialPage<void>(child: AddCardToCollection());

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddCardToCollectionState();
}

class _AddCardToCollectionState extends ConsumerState<AddCardToCollection> {
  TextEditingController cardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cardList = ref.watch(
      getCardsFromNameProvider(cardNameController.text),
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) => {
        if (!canPop) ref.read(navigationProvider.notifier).closeAddCardPage()
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('ADD CARD')),
        body: Column(children: [
          searchBar(),
          searchResult(cardList.valueOrNull ?? []),
        ]),
      ),
    );
  }

  Widget searchBar() {
    return TextFormField(
      controller: cardNameController,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)?.search_card,
      ),
      autofocus: true,
    );
  }

  Widget searchResult(Iterable<MtgCard> cardList) {
    return Expanded(
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (0.6),
          children:
              cardList.map((card) => _SearchCardPreview(card: card)).toList()),
    );
  }
}

class _SearchCardPreview extends StatelessWidget {
  const _SearchCardPreview({required this.card});

  final MtgCard card;

  @override
  Widget build(BuildContext context) {
    print(card);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      //TODO: Enlarge on click
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(card.imageUri.toString()),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CachedNetworkImage(
              imageUrl: card.imageUri?[0].toString() ?? '',
              placeholder: (_, __) => const SizedBox(
                height: 204,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (_, __, ___) => const SizedBox(
                height: 204,
                child: Icon(Icons.image_not_supported),
              ),
            ),

            ///Image.network(card.imageUriSmall.toString()),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(card.name ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}
