import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/services/auth/auth_user.dart';
import 'package:local_card_trading/utils/dialogs.dart';
import 'package:local_card_trading/views/home/subpages/near_me.dart';
import 'package:local_card_trading/views/home/subpages/to_buy.dart';
import 'package:local_card_trading/views/home/subpages/to_sell.dart';

import '../../services/auth/auth_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _bottomNavIndex = 0;
  final AuthUser _authUser = AuthService.firebase().currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_name),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(ROUTE_SETTINGS),
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(_authUser.photoURL ?? ''),
                ),
                accountName: Text(_authUser.displayName ?? ''),
                accountEmail: Text(_authUser.email ?? ''),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(AppLocalizations.of(context)!.logout),
              onTap: () => showConfirmDialog(
                context: context,
                title: AppLocalizations.of(context)!.logoud_dialog_title,
                text: AppLocalizations.of(context)!.logoud_dialog_text,
                onAcceptPressed: () => AuthService.firebase().logOut().then(
                      (value) => Navigator.of(context).pushNamedAndRemoveUntil(
                        ROUTE_LOGIN,
                        (route) => false,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
      body: const <Widget>[
        ToBuyView(),
        ToSellView(),
        NearMeView(),
      ][_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: bottomNavigationBarItems(),
        onTap: (i) => setState(() => _bottomNavIndex = i),
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
