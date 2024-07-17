import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/app/repository/firebase/cards_repository.dart';

class MyCollectionPage extends ConsumerWidget {
  const MyCollectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          // GestureDetector(
          //   onTap: () {
          //     ref
          //         .read(navigationProvider.notifier)
          //         .openFullScreenImage('https://picsum.photos/250?image=9');
          //   },
          //   child: Hero(
          //     tag: FULL_SCREEN_IMAGE_HERO_TAG,
          //     child: Image.network(
          //       'https://picsum.photos/250?image=9',
          //     ),
          //   ),
          // ),
          // TextButton(onPressed: () => saveCity(), child: Text('PROVA'))
        ],
      ),
      // const Column(children: [
      //   Text('COLLECTION'),
      // ]),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(navigationProvider.notifier).openAddCardPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
      ),
    );
  }
}
