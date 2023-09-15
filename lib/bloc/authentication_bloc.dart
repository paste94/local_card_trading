import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_card_trading/services/auth/auth_provider.dart';
import 'package:local_card_trading/services/auth/auth_user.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthProvider _authProvider;

  AuthenticationBloc(this._authProvider) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AuthenticationStarted) {
        AuthUser? user = await _authProvider.currentUser;
        if (user == null) {
          emit(AuthenticationFailure());
        }
        if (user!.uid != "uid") {
          String? displayName = await user.displayName;
          emit(AuthenticationSuccess(displayName: displayName));
        } else {
          emit(AuthenticationFailure());
        }
      } else if (event is AuthenticationSignedOut) {
        await _authProvider.signOut();
        emit(AuthenticationFailure());
      }
    });
  }
}
