part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

final class AuthState extends Equatable {
  const AuthState._({
    required this.status,
    this.user = User.empty,
    this.errorMsg = '',
    this.isLoading = false,
  });

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  final AuthStatus status;
  final User user;
  final String errorMsg;
  final bool isLoading;

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMsg,
    bool? isLoading,
  }) {
    return AuthState._(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [status, user, errorMsg, isLoading];
}
