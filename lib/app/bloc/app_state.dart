part of 'app_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

enum SelectedPage {
  home,
  addCardToCollection,
  profilePicDetails,
}

final class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.selectedPage = SelectedPage.home,
    this.user = User.empty,
    this.errorMsg = '',
    this.isLoading = false,
    this.connectionError = false,
  });

  const AppState.unauthenticated() : this._(status: AuthStatus.unauthenticated);

  const AppState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  final AuthStatus status;
  final SelectedPage selectedPage;
  final User user;
  final String errorMsg;
  final bool isLoading;
  final bool connectionError;

  AppState copyWith({
    AuthStatus? status,
    SelectedPage? selectedPage,
    User? user,
    String? errorMsg,
    bool? isLoading,
    bool? connectionError,
  }) {
    return AppState._(
      status: status ?? this.status,
      selectedPage: selectedPage ?? this.selectedPage,
      user: user ?? this.user,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading ?? this.isLoading,
      connectionError: connectionError ?? this.connectionError,
    );
  }

  @override
  List<Object> get props => [
        status,
        selectedPage,
        user,
        errorMsg,
        isLoading,
        connectionError,
      ];
}
