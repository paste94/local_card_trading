import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';
import 'package:local_card_trading/src/core/widgets/inputs/confirmed_password.dart';
import 'package:local_card_trading/src/core/widgets/inputs/email.dart';
import 'package:local_card_trading/src/core/widgets/inputs/password.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/state/authentication_state.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});
  static Page<void> page() => const MaterialPage<void>(child: RegisterView());

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  Email email = const Email.pure();
  Password password = const Password.pure();
  ConfirmedPassword confirmedPassword = const ConfirmedPassword.pure();
  bool isValid = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmedPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(_emailChanged);
    passwordController.addListener(_passwordChanged);
    confirmedPasswordController.addListener(_confirmedPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthenticationState>(authenticationProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(next.error!),
              showCloseIcon: true,
            ),
          ).closed.then(
                (value) =>
                    ref.read(authenticationProvider.notifier).dismissError(),
              );
      }
    });

    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (!canPop) {
          ref.read(authenticationProvider.notifier).closeRegisterPage();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.register)),
        body: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              _emailInput(),
              const SizedBox(height: 8),
              _passwordInput(),
              const SizedBox(height: 8),
              _repeatPasswordInput(),
              const SizedBox(height: 8),
              _registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  TextField _emailInput() => TextField(
        key: const Key('LoginView_emailInput_textField'),
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        decoration: InputDecoration(
            labelText: AppLocalizations.of(context)?.enter_email,
            helperText: '',
            errorText: email.displayError != null
                ? AppLocalizations.of(context)?.invalid_email
                : null),
      );

  TextField _passwordInput() => TextField(
        key: const Key('LoginView_passwordInput_textField'),
        obscureText: true,
        controller: passwordController,
        decoration: InputDecoration(
            labelText: AppLocalizations.of(context)?.password,
            helperText: '',
            errorText: password.displayError != null
                ? AppLocalizations.of(context)?.invalid_password
                : null),
      );

  TextField _repeatPasswordInput() => TextField(
        key: const Key('LoginView_repeatPasswordInput_textField'),
        obscureText: true,
        controller: confirmedPasswordController,
        decoration: InputDecoration(
            labelText: AppLocalizations.of(context)?.repeat_password,
            helperText: '',
            errorText: confirmedPassword.displayError != null
                ? AppLocalizations.of(context)?.invalid_password
                : null),
      );

  ElevatedButton _registerButton() => ElevatedButton(
        key: const Key('signUpForm_continue_raisedButton'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        onPressed: isValid ? _register : null,
        child: Text(AppLocalizations.of(context)!.register),
      );

  void _emailChanged() => setState(() {
        email = Email.dirty(emailController.text);
        isValid = _checkValidity();
      });

  void _passwordChanged() => setState(() {
        password = Password.dirty(passwordController.text);
        confirmedPassword = ConfirmedPassword.dirty(
          password: passwordController.text,
          value: confirmedPasswordController.text,
        );
        isValid = _checkValidity();
      });

  void _confirmedPasswordChanged() => setState(() {
        confirmedPassword = ConfirmedPassword.dirty(
          password: passwordController.text,
          value: confirmedPasswordController.text,
        );
        isValid = _checkValidity();
      });

  bool _checkValidity() =>
      Formz.validate([email, password, confirmedPassword]) &&
      password.value == confirmedPassword.value;

  void _register() => ref
      .read(authenticationProvider.notifier)
      .register(email: email.value, password: password.value);
}
