import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  BuildContext? dialogContext;

  @override
  Widget build(BuildContext context) {
    ref.listen<NavigationState>(navigationProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(next.error!),
              showCloseIcon: true,
            ),
          ).closed.then(
                (value) => ref.read(navigationProvider.notifier).dismissError(),
              );
      }
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
        print('DISMISSSSSS');
        if (dialogContext != null) {
          Navigator.of(dialogContext!).pop();
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: widgetsList.elementAt(_selectedPageIndex),
      bottomNavigationBar: _bottomNavBar(),
      // floatingActionButton: Visibility(
      //   child: FloatingActionButton(
      //     onPressed: () =>
      //         ref.read(navigationProvider.notifier).openDialog(),
      //   ),
      // ),
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
