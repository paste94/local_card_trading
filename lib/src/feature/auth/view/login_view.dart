import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:local_card_trading/src/core/widgets/email.dart';
import 'package:local_card_trading/src/core/widgets/password.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  static Page<void> page() => const MaterialPage<void>(child: LoginView());
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  Email email = const Email.pure();
  Password password = const Password.pure();
  bool isValid = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(_emailChanged);
    passwordController.addListener(_passwordChanged);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                _emailInput(),
                const SizedBox(height: 8),
                _passwordInput(),
                const SizedBox(height: 16),
                _loginButton(),
                const SizedBox(height: 8),
                _googleLogin(),
                const SizedBox(height: 4),
                _signUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField _emailInput() => TextField(
        key: const Key('LoginView_emailInput_textField'),
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        enabled: !ref.watch(authenticationProvider).loading,
        decoration: InputDecoration(
            labelText: AppLocalizations.of(context)?.enter_email,
            helperText: '',
            errorText: email.displayError != null
                ? AppLocalizations.of(context)?.invalid_password
                : null),
      );

  TextField _passwordInput() => TextField(
        key: const Key('LoginView_passwordInput_textField'),
        controller: passwordController,
        obscureText: true,
        enabled: !ref.watch(authenticationProvider).loading,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)?.password,
          helperText: '',
          errorText: password.displayError != null
              ? AppLocalizations.of(context)?.invalid_password
              : null,
        ),
      );

  Widget _loginButton() => ref.watch(authenticationProvider).loading
      ? const CircularProgressIndicator()
      : ElevatedButton(
          key: const Key('LoginView_continue_raisedButton'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: const Color(0xFFFFD600),
          ),
          onPressed: isValid ? _logInWithUsernamePassword : null,
          child: Text(AppLocalizations.of(context)?.login ?? ''),
        );

  ElevatedButton _googleLogin() => ElevatedButton.icon(
        key: const Key('LoginView_googleLogin_raisedButton'),
        label: Text(
          AppLocalizations.of(context)?.login_with_google ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
        onPressed:
            ref.watch(authenticationProvider).loading ? null : _loginWithGoogle,
      );

  Widget _signUpButton() => TextButton(
        key: const Key('LoginView_createAccount_flatButton'),
        onPressed: () => {
          ref.read(authenticationProvider.notifier).openRegisterPage(),
        },
        child: Text(
          AppLocalizations.of(context)?.click_to_register ?? '',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      );

  void _emailChanged() => setState(() {
        email = Email.dirty(emailController.text);
        _checkValidity();
      });

  void _passwordChanged() => setState(() {
        password = Password.dirty(passwordController.text);
        isValid = _checkValidity();
      });

  bool _checkValidity() => Formz.validate([email, password]);

  void _logInWithUsernamePassword() => ref
      .read(authenticationProvider.notifier)
      .login(
        email: email.value,
        password: password.value,
      )
      .catchError((error) => {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error is LogInWithEmailAndPasswordFailure
                  ? error.message
                  : AppLocalizations.of(context)!.auth_error),
            ))
          });

  void _loginWithGoogle() => ref
      .read(authenticationProvider.notifier)
      .loginWithGoogle()
      .catchError((error) => {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error is LogInWithEmailAndPasswordFailure
                  ? error.message
                  : AppLocalizations.of(context)!.auth_error),
            ))
          });
}
