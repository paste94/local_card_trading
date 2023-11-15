import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:local_card_trading/pages/home/view/constants.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) => setState(
        () => _selectedPageIndex =
            SelectedPage.values.indexOf(state.selectedPage),
      ),
      child: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) => context.read<HomeBloc>().add(
              HomePageSelected(
                SelectedPage.values[index],
              ),
            ),
      ),
    );
  }
}
