import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/constants/constants.dart';
import 'package:local_card_trading/src/feature/add_card_to_collection/provider/selected_card_provider.dart';

class NoteTextField extends ConsumerStatefulWidget {
  const NoteTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoteTextFieldState();
}

class _NoteTextFieldState extends ConsumerState<NoteTextField> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _noteController.addListener(() =>
        ref.read(selectedCardProvider.notifier).setNote(_noteController.text));
    return Container(
      padding: const EdgeInsets.all(PADDING),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: _noteController,
        decoration: const InputDecoration(
          labelText: 'Note',
        ),
      ),
    );
  }
}
