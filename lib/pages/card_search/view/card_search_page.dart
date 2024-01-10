import 'package:flutter/material.dart';

class CardSearchPage extends StatelessWidget {
  const CardSearchPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: CardSearchPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text("Sample"),
        centerTitle: true,
      ),
      body: const Center(
          child: Hero(
        tag: 'OpenSearchTag',
        child: Placeholder(),
      )),
    );
  }
}
