import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/services/auth/auth_service.dart';
import 'package:local_card_trading/views/home/subpages/near_me.dart';
import 'package:local_card_trading/views/home/subpages/to_buy.dart';
import 'package:local_card_trading/views/home/subpages/to_sell.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_name),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed(ROUTE_SETTINGS);
              }),
        ],
      ),
      body: const <Widget>[
        ToBuyView(),
        ToSellView(),
        NearMeView(),
      ][_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: bottomNavigationBarItems(),
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavigationBarItems() {
  return const [
    BottomNavigationBarItem(
      label: 'TO BUY',
      icon: Icon(Icons.euro),
    ),
    BottomNavigationBarItem(
      label: 'TO SELL',
      icon: Icon(Icons.money_off),
    ),
    BottomNavigationBarItem(
      label: 'Near me',
      icon: Icon(Icons.location_on),
    ),
  ];
}
