part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
  });

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
