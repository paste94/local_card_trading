import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/app.dart';

class AddCardToCollectionPage extends StatelessWidget {
  const AddCardToCollectionPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: AddCardToCollectionPage());

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (_) => context.read<AppBloc>().add(const GoToHomePage()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Details'),
          ),
          body: Center(
              child: Column(
            children: [
              TextButton(
                onPressed: () => {},
                child: Text('CIAO'),
              ),
            ],
          )),
        ));
  }
}
