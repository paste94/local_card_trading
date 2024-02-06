import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/app/state/app_state.dart';
import 'package:local_card_trading/app/state/auth.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({
//     required AuthenticationRepository authenticationRepository,
//     super.key,
//   }) : _authenticationRepository = authenticationRepository;

//   final AuthenticationRepository _authenticationRepository;

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: _authenticationRepository,
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (_) => AppBloc(
//               authenticationRepository: _authenticationRepository,
//             ),
//           ),
//           BlocProvider(
//             create: (context) => HomeBloc(),
//           ),
//         ],
//         child: const AppView(),
//       ),
//     );
//   }
// }

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BuildContext? dialogContext;
    User user = ref.watch(userProvider);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FlowBuilder<User>(
        state: user,
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
