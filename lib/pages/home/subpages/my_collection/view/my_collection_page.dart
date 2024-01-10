import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/my_collection_cubit.dart';

class MyCollectionPage extends StatelessWidget {
  const MyCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            context.read<MyCollectionCubit>().searchCardTextChanged(value);
          },
        ),
        const Divider(),
        // BlocListener<MyCollectionCubit, MyCollectionState>(
        //   listener: (context, state) {
        //     print('LISTEN ${state}');
        //   },
        //   child: Text('OPEN'),
        // )
        BlocBuilder<MyCollectionCubit, MyCollectionState>(
          buildWhen: (previous, current) =>
              previous.searchCardText != current.searchCardText,
          builder: (context, state) {
            if (state.isSearchPageOpen) {
              return const Text('OPEN');
            } else {
              return const Text('CLOSED');
            }
          },
        ),
      ],
    );
  }
}
