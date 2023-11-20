import 'package:flutter/material.dart';
import 'package:local_card_trading/pages/home/subpages/subpages.dart';

enum SelectedPage { buy, myCollection, sell, settings }

/// Edit here to add pages
final Map<SelectedPage, Item> _navItems = {
  SelectedPage.buy: Item(
    icon: const Icon(Icons.search),
    label: 'Search',
    page: const BuyPage(),
  ),
  SelectedPage.myCollection: Item(
    icon: const Icon(Icons.list),
    label: 'My Collection',
    page: const MyCollectionPage(),
  ),
  SelectedPage.sell: Item(
    icon: const Icon(Icons.sell),
    label: 'Sell',
    page: const SellPage(),
  ),
  SelectedPage.settings: Item(
    icon: const Icon(Icons.settings),
    label: 'Settings',
    page: const SettingsPage(),
  )
};

final class Item {
  Item({
    required this.icon,
    required this.label,
    required this.page,
  });
  Icon icon;
  String label;
  Widget page;
}

final List<BottomNavigationBarItem> bottomNavItems = _navItems.values
    .map((elem) => BottomNavigationBarItem(
          icon: elem.icon,
          label: elem.label,
        ))
    .toList();

final List<Widget> widgetsList =
    _navItems.values.map((elem) => elem.page).toList();