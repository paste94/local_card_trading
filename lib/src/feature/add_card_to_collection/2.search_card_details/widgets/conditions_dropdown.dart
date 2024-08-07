import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_card_trading/src/app/models/my_mtg_card.dart';
import 'package:local_card_trading/src/constants/constants.dart';
import 'package:local_card_trading/src/constants/enums/conditions_enum.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/selected_card_provider.dart';

class ConditionsDropdown extends ConsumerWidget {
  const ConditionsDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyMtgCard? selectedCard = ref.watch(selectedCardProvider);

    var dropdownConditionsList = Conditions.values
        .map((conditions) => DropdownMenuItem(
              value: conditions,
              child: Row(
                children: [
                  SvgPicture.asset(
                    conditions.iconUri,
                    height: 30,
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        '  ${conditions.name}',
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            ))
        .toList();

    return Container(
      padding: const EdgeInsets.all(PADDING),
      child: DropdownButton<Conditions>(
        value: selectedCard?.conditions,
        items: dropdownConditionsList,
        onChanged: (cond) => ref
            .read(selectedCardProvider.notifier)
            .setConditions(cond ?? Conditions.mint),
        isExpanded: true,
      ),
    );
  }
}
