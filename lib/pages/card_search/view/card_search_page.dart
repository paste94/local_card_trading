import 'package:flutter/material.dart';

class CardSearchPage extends StatelessWidget {
  const CardSearchPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: CardSearchPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text("Sample"),
        centerTitle: true,
      ),
      body: Center(
          child: Hero(
        tag: 'OpenSearchTag',
        child: Placeholder(),
      )),
    );
  }
}
