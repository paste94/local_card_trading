import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:formz/formz.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/feature/auth/providers/login/login_provider.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginView());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              // _LoginButton(),
              // const SizedBox(height: 8),
              // _GoogleLoginButton(),
              // const SizedBox(height: 4),
              // _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      key: const Key('LoginView_emailInput_textField'),
      keyboardType: TextInputType.emailAddress,
      onChanged: (email) =>
          ref.read(loginProvider.notifier).emailChanged(email),
      decoration: InputDecoration(
          labelText: AppLocalizations.of(context)?.enter_email,
          helperText: '',
          errorText: ref.read(loginProvider).email.displayError != null
              ? AppLocalizations.of(context)?.invalid_password
              : null),
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      key: const Key('LoginView_passwordInput_textField'),
      onChanged: (password) =>
          ref.read(loginProvider.notifier).emailChanged(password),
      obscureText: true,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)?.password,
        errorText: ref.read(loginProvider).password.displayError != null
            ? AppLocalizations.of(context)?.invalid_password
            : null,
      ),
    );
  }
}

// class _LoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginCubit, LoginState>(
//       builder: (context, state) {
//         return state.status.isInProgress
//             ? const CircularProgressIndicator()
//             : ElevatedButton(
//                 key: const Key('LoginView_continue_raisedButton'),
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   backgroundColor: const Color(0xFFFFD600),
//                 ),
//                 onPressed: state.isValid
//                     ? () => context.read<LoginCubit>().logInWithCredentials()
//                     : null,
//                 child: Text(AppLocalizations.of(context)?.login ?? ''),
//               );
//       },
//     );
//   }
// }

// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return ElevatedButton.icon(
//       key: const Key('LoginView_googleLogin_raisedButton'),
//       label: Text(
//         AppLocalizations.of(context)?.login_with_google ?? '',
//         style: const TextStyle(color: Colors.white),
//       ),
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         backgroundColor: theme.colorScheme.secondary,
//       ),
//       icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
//       onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
//     );
//   }
// }

// class _SignUpButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return TextButton(
//       key: const Key('LoginView_createAccount_flatButton'),
//       onPressed: () => Navigator.of(context).push<void>(RegisterPage.route()),
//       child: Text(
//         AppLocalizations.of(context)?.click_to_register ?? '',
//         style: TextStyle(color: theme.primaryColor),
//       ),
//     );
//   }
// }
