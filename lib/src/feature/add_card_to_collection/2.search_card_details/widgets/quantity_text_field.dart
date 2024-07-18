import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/constants/constants.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/selected_card_provider.dart';

class QuantityTextField extends ConsumerStatefulWidget {
  const QuantityTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuantityTextFieldState();
}

class _QuantityTextFieldState extends ConsumerState<QuantityTextField> {
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text =
        ref.read(selectedCardProvider)?.quantity.toString() ?? '0';
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _quantityController.addListener(() {
      // print(_quantityController.text);
      var intVal = int.parse(_quantityController.text);
      // print(intVal);
      ref.read(selectedCardProvider.notifier).setQuantity(intVal);
    });
    return Container(
      padding: const EdgeInsets.all(PADDING),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        controller: _quantityController,
        decoration: InputDecoration(
          labelText: 'Quantity',
          hintText: '0',
          errorText: ref.watch(selectedCardProvider)?.quantity.toString() == '0'
              ? 'Quantity must be > 0'
              : null,
        ),
      ),
    );
  }
}
