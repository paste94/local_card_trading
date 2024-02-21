import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';
import 'package:local_card_trading/src/feature/home/view/home_bottom_nav_items.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomeView());

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    ref.watch(authenticationProvider).loading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: widgetsList.elementAt(_selectedPageIndex),
      bottomNavigationBar: _bottomNavBar(),
      floatingActionButton: Visibility(
        child: FloatingActionButton(onPressed: () => {}),
      ),
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
