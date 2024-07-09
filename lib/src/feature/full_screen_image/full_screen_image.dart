import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/const/constants.dart';
import 'package:local_card_trading/src/core/navigation/riverpod/navigation_provider.dart';

class FullScreenImage extends ConsumerWidget {
  const FullScreenImage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: FullScreenImage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String image = ref.read(navigationProvider).fullScreenImage ?? '';

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          ref.read(navigationProvider.notifier).closeFullScreenImage();
        },
        child: Center(
          child: Hero(
            tag: FULL_SCREEN_IMAGE_HERO_TAG,
            child: Image.network(image),
          ),
        ),
      ),
    );
  }
}
