part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

enum SelectedPage {
  home,
  addCardToCollection,
}

final class AuthState extends Equatable {
  const AuthState._({
    required this.status,
    this.selectedPage = SelectedPage.home,
    this.user = User.empty,
    this.errorMsg = '',
    this.isLoading = false,
  });

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  final AuthStatus status;
  final SelectedPage selectedPage;
  final User user;
  final String errorMsg;
  final bool isLoading;

  AuthState copyWith({
    AuthStatus? status,
    SelectedPage? selectedPage,
    User? user,
    String? errorMsg,
    bool? isLoading,
  }) {
    return AuthState._(
      status: status ?? this.status,
      selectedPage: selectedPage ?? this.selectedPage,
      user: user ?? this.user,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [status, selectedPage, user, errorMsg, isLoading];
}
