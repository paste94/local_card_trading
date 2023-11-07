part of 'form_bloc.dart';

abstract class FormState extends Equatable {
  const FormState();
}

class FormInitial extends FormState {
  @override
  List<Object?> get props => [];
}

class FormsValidate extends FormState {
  const FormsValidate({
        required this.email,
        required this.password,
        required this.repeatPassword,
        required this.isEmailValid,
        required this.isPasswordValid,
        required this.isRepeatPasswordValid,
        required this.isFormValid,
        required this.isLoading,
        this.errorMessage = "",
        required this.isNameValid,
        required this.isBirthDateValid,
        required this.isFormValidateFailed,
        this.displayName,
        required this.birthDate,
        this.isFormSuccessful = false,
      });

  final String email;
  final String? displayName;
  final DateTime birthDate;
  final String password;
  final String repeatPassword;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isRepeatPasswordValid;
  final bool isFormValid;
  final bool isNameValid;
  final bool isBirthDateValid;
  final bool isFormValidateFailed;
  final bool isLoading;
  final String errorMessage;
  final bool isFormSuccessful;

  FormsValidate copyWith(
      {String? email,
      String? password,
      String? repeatPassword,
      String? displayName,
      bool? isEmailValid,
      bool? isPasswordValid,
      bool? isRepeatPasswordValid,
      bool? isFormValid,
      bool? isLoading,
      DateTime? birthDate,
      String? errorMessage,
      bool? isNameValid,
      bool? isBirthDateValid,
      bool? isFormValidateFailed,
      bool? isFormSuccessful}) {
    return FormsValidate(
        email: email ?? this.email,
        password: password ?? this.password,
        repeatPassword: repeatPassword ?? this.repeatPassword,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isRepeatPasswordValid: isRepeatPasswordValid ?? this.isRepeatPasswordValid,
        isFormValid: isFormValid ?? this.isFormValid,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isNameValid: isNameValid ?? this.isNameValid,
        birthDate: birthDate ?? this.birthDate,
        isBirthDateValid: isBirthDateValid ?? this.isBirthDateValid,
        displayName: displayName ?? this.displayName,
        isFormValidateFailed: isFormValidateFailed ?? this.isFormValidateFailed,
        isFormSuccessful: isFormSuccessful ?? this.isFormSuccessful);
  }

  @override
  List<Object?> get props => [
        email,
        password,
        repeatPassword,
        isEmailValid,
        isPasswordValid,
        isRepeatPasswordValid,
        isFormValid,
        isLoading,
        errorMessage,
        isNameValid,
        displayName,
        birthDate,
        isFormValidateFailed,
        isFormSuccessful,
      ];

  @override
  String toString() {
    var obj = {
      'email': email,
      'password': password,
      'repeatPassword': repeatPassword,
      'isEmailValid': isEmailValid,
      'isPasswordValid': isPasswordValid,
      'isRepeatPasswordValid': isRepeatPasswordValid,
      'isFormValid': isFormValid,
      'isLoading': isLoading,
      'errorMessage': errorMessage,
      'isNameValid': isNameValid,
      'isBirthDateValid': isBirthDateValid,
      'isFormValidateFailed': isFormValidateFailed,
      'displayName': displayName,
      'birthDate': birthDate,
      'isFormSuccessful': isFormSuccessful,
    };
    return obj.toString();
  }
}
