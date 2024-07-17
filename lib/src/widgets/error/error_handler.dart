import 'package:flutter/material.dart';
import 'package:local_card_trading/src/providers/error/error_provider.dart';

errorHandler(context, ref, previous, next) {
  if (next.error != null) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(next.error!),
          showCloseIcon: true,
        ),
      ).closed.then(
            (value) => ref.read(errorProvider.notifier).dismissError(),
          );
  }
}
