import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/navigation/riverpod/navigation_provider.dart';

class MyCollectionPage extends ConsumerWidget {
  const MyCollectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const Column(children: [
        Text('COLLECTION'),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(navigationProvider.notifier).openAddCardPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
