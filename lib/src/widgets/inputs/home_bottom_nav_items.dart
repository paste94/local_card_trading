import 'package:flutter/material.dart';
import 'package:local_card_trading/src/feature/my_collection/view/my_collection_page.dart';
import 'package:local_card_trading/src/feature/settings/view/settings_page.dart';

enum SelectedHomePage { myCollection, settings }

/// Edit here to add pages
final Map<SelectedHomePage, Item> _navItems = {
  SelectedHomePage.myCollection: Item(
    icon: const Icon(Icons.list),
    label: 'My Collection',
    page: const MyCollectionPage(),
  ),
  SelectedHomePage.settings: Item(
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
