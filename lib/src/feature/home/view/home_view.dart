import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/app/handlers/error_handler.dart';
import 'package:local_card_trading/src/app/handlers/loading_handler.dart';
import 'package:local_card_trading/src/core/errors/error_provider.dart';
import 'package:local_card_trading/src/core/errors/state/error_state.dart';
import 'package:local_card_trading/src/core/loading/loading_provider.dart';
import 'package:local_card_trading/src/core/loading/state/loading_state.dart';
import 'package:local_card_trading/src/core/navigation/navigation_provider.dart';
import 'package:local_card_trading/src/core/navigation/state/navigation_state.dart';
import 'package:local_card_trading/src/feature/home/view/home_bottom_nav_items.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomeView());

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedPageIndex = 0;
  LoadingHandler loadingHandler = LoadingHandler();

  @override
  Widget build(BuildContext context) {
    ref.listen<ErrorState>(
      errorProvider,
      (previous, next) => errorHandler(context, ref, previous, next),
    );

    ref.listen<LoadingState>(
      loadingProvider,
      (previous, next) => loadingHandler.handle(context, previous, next),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: widgetsList.elementAt(_selectedPageIndex),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() => BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: (index) => setState(() {
          _selectedPageIndex = index;
        }),
      );
}
