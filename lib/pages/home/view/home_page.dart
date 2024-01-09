import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/app.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:local_card_trading/pages/home/subpages/my_collection/cubit/my_collection_cubit.dart';
import 'package:local_card_trading/pages/home/view/constants.dart';
import 'package:local_card_trading/pages/home/view/home_body.dart';
import 'package:local_card_trading/pages/home/view/home_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => MyCollectionCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const HomeBody(),
        bottomNavigationBar: const HomeBottomNavigationBar(),
        floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Visibility(
              visible: state.selectedPage == SelectedPage.myCollection,
              child: FloatingActionButton(
                onPressed: () => {
                  //https://techpotatoes.com/2021/07/20/flutter-development-series-part-5-bloc-pattern-and-navigation-in-flutter/
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
