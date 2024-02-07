import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDialog extends ConsumerWidget {
  const CustomDialog({super.key});

  static Page<void> page() => const MaterialPage<void>(child: CustomDialog());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Dialog(
      child: CircularProgressIndicator(),
    );
  }
}
