import 'package:cards_repository/cards_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/add_card_to_collection/bloc/search_card_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCardToCollectionForm extends StatelessWidget {
  const AddCardToCollectionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CardNameInput(),
          Divider(),
          _CardList(),
        ],
      ),
    );
  }
}

class _CardNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final api = CardsProvider();

    return BlocBuilder<SearchCardBloc, SearchCardState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: 8,
              child: Autocomplete<String>(
                fieldViewBuilder: (BuildContext context,
                    TextEditingController controller,
                    FocusNode focus,
                    VoidCallback onFieldSubmitted) {
                  return BlocListener<SearchCardBloc, SearchCardState>(
                    listenWhen: (previous, current) =>
                        previous.isInputNameSelected &&
                        !current.isInputNameSelected,
                    listener: (context, state) {
                      controller.text = state.inputName;
                      Future.delayed(
                        const Duration(milliseconds: 10),
                        () => focus.requestFocus(),
                      );
                    },
                    child: TextFormField(
                      onChanged: (name) => context
                          .read<SearchCardBloc>()
                          .add(InputNameChanged(name)),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)?.search_card,
                      ),
                      autofocus: true,
                      enabled: !state.isInputNameSelected,
                      controller: controller,
                      focusNode: focus,
                      onFieldSubmitted: (String value) => onFieldSubmitted(),
                    ),
                  );
                },
                optionsBuilder: (TextEditingValue textEditingValue) async {
                  if (textEditingValue.text.isEmpty) {
                    return [];
                  }
                  try {
                    return await api
                        .autoCompleteCardName(textEditingValue.text);
                  } catch (e) {
                    context.read<AppBloc>().add(const ConnectionError());
                    return [];
                  }
                },
                onSelected: (String selection) =>
                    context.read<SearchCardBloc>().add(CardSelected(selection)),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () =>
                    context.read<SearchCardBloc>().add(const CardDeselected()),
              ),
            )
          ],
        );
      },
    );
  }
}

class _SetNameInput extends StatelessWidget {
  const _SetNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _CardList extends StatelessWidget {
  const _CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCardBloc, SearchCardState>(
      builder: (context, state) {
        return state.isSearchCardListLoading
            ? CircularProgressIndicator()
            : Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (0.67),
                  children: state.searchCardsList
                      .map((card) => _SearchCardPreview(card: card))
                      .toList(),
                ),
              );
      },
    );
  }
}

class _SearchCardPreview extends StatelessWidget {
  const _SearchCardPreview({required this.card, super.key});

  final MtgCard card;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 190,
              width: 2000,
              child: Image.network(card.imageUri.toString()),
            ),
            const Divider(),
            Text(card.setName),
          ],
        ),
      ),
    );
  }
}
