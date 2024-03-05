import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProgressDialog extends ConsumerWidget {
  const ProgressDialog({super.key});

  static Page<void> page() => const MaterialPage<void>(child: ProgressDialog());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Dialog(
      child: CircularProgressIndicator(),
    );
  }
}
