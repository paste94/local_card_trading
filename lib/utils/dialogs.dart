import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<Object?> showErrorDialog({
  required BuildContext context,
  required String text,
  Function? callback,
}) =>
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(AppLocalizations.of(context)?.error_occurred ?? ''),
            content: Text(text),
            actions: [
              TextButton(
                onPressed: () {
                  if (callback != null) {
                    callback();
                  }
                  Navigator.of(context).pop;
                },
                child: Text(AppLocalizations.of(context)?.ok ?? ''),
              )
            ],
          )),
    );

Future<Object?> showConfirmDialog({
  required BuildContext context,
  required String title,
  required String text,
  VoidCallback? onAcceptPressed,
}) =>
    showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(AppLocalizations.of(context)?.dismiss ?? ''),
              ),
              TextButton(
                onPressed: onAcceptPressed,
                child: Text(AppLocalizations.of(context)?.confirm ?? ''),
              ),
            ],
          )),
    );
