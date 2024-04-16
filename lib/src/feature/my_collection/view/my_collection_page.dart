import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';

class MyCollectionPage extends ConsumerStatefulWidget {
  const MyCollectionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MyCollectionPageState();
}

class _MyCollectionPageState extends ConsumerState<MyCollectionPage> {
  @override
  Widget build(BuildContext context) {
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
