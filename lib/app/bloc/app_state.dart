part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

final class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
    this.errorMsg = '',
  });

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);
  const AppState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  final AppStatus status;
  final User user;
  final String errorMsg;

  AppState copyWith({
    AppStatus? status,
    User? user,
    String? errorMsg,
  }) {
    return AppState._(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object> get props => [status, user, errorMsg];
}
