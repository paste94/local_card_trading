import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/auth_bloc/auth_bloc.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:local_card_trading/pages/home/view/constants.dart';
import 'package:local_card_trading/pages/pic_details/view/pic_details.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final User user = context.select((AuthBloc bloc) => bloc.state.user);

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        print('LISTEN');
        setState(
          () => _selectedPageIndex =
              SelectedPage.values.indexOf(state.selectedPage),
        );
        if (state.isPicDetailsSelected) {
          print('SET TO TRUE');
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen(
              tag: 'profile_img_tag',
              url: user.photo ?? '',
            );
          }));
        }
      },
      child: widgetsList.elementAt(_selectedPageIndex),
    );
  }
}
