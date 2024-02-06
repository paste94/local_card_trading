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
    _selectedPageIndex = context.read<HomeBloc>().state.selectedPage.index;
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          previous.selectedPage != current.selectedPage,
      listener: (context, state) => setState(
        () => _selectedPageIndex =
            SelectedHomePage.values.indexOf(state.selectedPage),
      ),
      child: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: (index) => context.read<HomeBloc>().add(
              HomePageSelected(
                SelectedHomePage.values[index],
              ),
            ),
      ),
    );
  }
}
