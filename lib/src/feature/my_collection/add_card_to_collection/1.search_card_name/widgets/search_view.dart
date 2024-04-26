import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/classes/my_mtg_card.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/provider/selected_card_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/1.search_card_name/provider/search_card_name_provider.dart';
import 'package:local_card_trading/src/feature/my_collection/add_card_to_collection/1.search_card_name/widgets/search_card_list_item.dart';
import 'package:scryfall_api/scryfall_api.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  Widget _onData(PaginableList cardList) {
    return cardList.length > 0
        ? Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (0.45),
              children: cardList.data
                  .map((card) => SearchCardListItem(myCard: card))
                  .toList(),
            ),
          )
        : Text('Nothing to show here :(');
  }

  Widget _onLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _onError(err, s) {
    if (err is ScryfallException) {
      return Text(err.details);
    } else {
      return Text(err.toString());
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardList = ref.watch(fetchCardsProvider);
    return Column(children: [
      TextFormField(
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)?.search_card,
        ),
        autofocus: true,
        onChanged: (value) =>
            ref.read(searchCardNameProvider.notifier).setState(value),
      ),
      const Divider(color: Colors.transparent),
      cardList.when(
        data: _onData,
        error: _onError,
        loading: _onLoading,
      )
    ]);
  }
}
