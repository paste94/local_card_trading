import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:local_card_trading/pages/home/view/constants.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) => setState(
        () => _selectedPageIndex =
            SelectedPage.values.indexOf(state.selectedPage),
      ),
      child: widgetsList.elementAt(_selectedPageIndex),
    );
  }
}
