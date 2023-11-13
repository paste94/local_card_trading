part of 'form_bloc.dart';

enum Status { signIn, signUp }

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends FormEvent {
  final String? email;
  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends FormEvent {
  final String? password;
  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class RepeatPasswordChanged extends FormEvent {
  final String? repeatPassword;
  const RepeatPasswordChanged(this.repeatPassword);

  @override
  List<Object?> get props => [repeatPassword];
}

class NameChanged extends FormEvent {
  final String? displayName;
  const NameChanged(this.displayName);

  @override
  List<Object?> get props => [displayName];
}

class BirthDateChanged extends FormEvent {
  final DateTime? birthDate;
  const BirthDateChanged(this.birthDate);

  @override
  List<Object?> get props => [birthDate];
}

class FormSubmitted extends FormEvent {
  final Status value;
  const FormSubmitted({required this.value});

  @override
  List<Object> get props => [value];
}

class FormSucceeded extends FormEvent {
  const FormSucceeded();

  @override
  List<Object> get props => [];
}

class ResetBlocState extends FormEvent {
  const ResetBlocState();

  @override
  List<Object> get props => [];
}

class ErrorMessageChanged extends FormEvent {
  final String? errorMessage;
  const ErrorMessageChanged({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
