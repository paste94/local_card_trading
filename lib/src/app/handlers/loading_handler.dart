import 'package:flutter/material.dart';

class LoadingHandler {
  BuildContext? dialogContext;

  LoadingHandler();

  handle(context, previous, next) {
    print('****************************************** APRI');

    if (next.loading) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            dialogContext = context;
            return const Dialog(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 15),
                    Text('Loading...')
                  ],
                ),
              ),
            );
          });
    }
    if (previous != null && previous.loading && !next.loading) {
      print('****************************************** CHIUDI');
      if (dialogContext != null) {
        Navigator.of(dialogContext!).pop();
      }
    }
  }
}
