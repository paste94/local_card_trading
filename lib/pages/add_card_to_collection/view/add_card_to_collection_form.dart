import 'package:cards_repository/cards_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/add_card_to_collection/bloc/selected_card_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCardToCollectionForm extends StatelessWidget {
  const AddCardToCollectionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CardNameInput(),
          ],
        ),
      ),
    );
  }
}

class _CardNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final api = CardsProvider();

    return BlocBuilder<SelectedCardBloc, SelectedCardState>(
      builder: (context, state) {
        return Column(
          children: [
            Autocomplete<String>(
              fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                return TextFormField(
                  onChanged: (name) => context
                      .read<SelectedCardBloc>()
                      .add(InputNameChanged(name)),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)?.search_card,
                    helperText: '',
                  ),
                  controller: controller,
                  focusNode: focusNode,
                  onFieldSubmitted: (String value) {
                    onFieldSubmitted();
                  },
                );
              },
              optionsBuilder: (TextEditingValue textEditingValue) async {
                if (textEditingValue.text.isEmpty) {
                  return [];
                }
                try {
                  return await api.autoCompleteCardName(textEditingValue.text);
                } catch (e) {
                  context.read<AppBloc>().add(const ConnectionError());
                  return [];
                }
              },
              onSelected: (String selection) {
                context.read<SelectedCardBloc>().add(CardSelected(selection));
              },
            ),
          ],
        );
      },
    );
  }
}
