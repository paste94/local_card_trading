import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:local_card_trading/app/state/app_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class AppState extends _$AppState {
  final NavigationRepository _authenticationRepository = NavigationRepository();
  late final StreamSubscription<User> _userSubscription;

  @override
  AppState build() {
    _userSubscription = _authenticationRepository.user.listen(
      (user) => userChanged(user),
    );
    appState = const AppState();
    return appState;
  }

  void userChanged(User user) {
    appState = appState.copyWith(currentUser: user);
  }
}

// @riverpod
// Stream<User> user(UserRef ref) {
//   AuthenticationRepository authenticationRepository =
//       AuthenticationRepository();

//   return authenticationRepository.user;
// }
