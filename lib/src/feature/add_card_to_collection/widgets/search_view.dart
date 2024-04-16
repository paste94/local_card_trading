import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/search_card_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/widgets/search_card_list_item.dart';
import 'package:scryfall_api/scryfall_api.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  TextEditingController cardNameController = TextEditingController();
  late AsyncValue cardList;

  void _updateCardList() {
    setState(() {
      cardList = ref.watch(fetchCards(cardNameController.text));
    });
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
        childAspectRatio: (0.45),
        children: cardList.data
            .map((card) => SearchCardListItem(myCard: card))
            .toList(),
      ),
    );
  }

  @override
  void initState() {
    cardNameController.addListener(_updateCardList);
    super.initState();
  }

  @override
  void dispose() {
    cardNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _updateCardList();
    return Column(children: [
      searchBar(),
      cardList.when(
        data: (data) => searchResult(data),
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      )
    ]);
  }
}
