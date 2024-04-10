import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/feature/my_collection/provider/search_card_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/src/feature/my_collection/view/widgets/search_card_list_item.dart';
import 'package:scryfall_api/scryfall_api.dart';

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
  void initState() {
    cardNameController.addListener(() {
      ref
          .read(searchCardProvider.notifier)
          .search(cardName: cardNameController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    cardNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cardList = ref.watch(searchCardProvider).searchCardList;

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) => {
        if (!canPop) ref.read(navigationProvider.notifier).closeAddCardPage()
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('ADD CARD')),
        body: Column(children: [
          searchBar(),
          searchResult(cardList ?? PaginableList(data: [], hasMore: false)),
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

  Widget searchResult(PaginableList<MyMtgCard> cardList) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (0.55),
        children: cardList.data
            .map((card) => SearchCardListItem(myCard: card))
            .toList(),
      ),
    );
  }
}
