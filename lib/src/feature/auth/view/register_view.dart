import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});
  static Page<void> page() => const MaterialPage<void>(child: RegisterView());

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  @override
  Widget build(BuildContext context) {
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
              Placeholder(),
              TextButton(
                  onPressed: () => ref
                      .read(authenticationProvider.notifier)
                      .closeRegisterPage(),
                  child: Text('DIOCANE'))
            ],
          ),
        ),
      ),
    );
  }
}

// class RegisterForm extends StatelessWidget {
//   const RegisterForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<RegisterCubit, RegisterState>(
//       listener: (context, state) {
//         if (state.status.isSuccess) {
//           Navigator.of(context).pop();
//         } else if (state.status.isFailure) {
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(
//               SnackBar(
//                 content: Text(
//                   state.errorMessage ??
//                       AppLocalizations.of(context)!.registration_error,
//                 ),
//               ),
//             )
//                 .closed
//                 .then((value) => context.read<RegisterCubit>().resetError());
//         }
//       },
//       child: Align(
//         alignment: const Alignment(0, -1 / 3),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _EmailInput(),
//             const SizedBox(height: 8),
//             _PasswordInput(),
//             const SizedBox(height: 8),
//             _ConfirmPasswordInput(),
//             const SizedBox(height: 8),
//             _RegisterButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _EmailInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterCubit, RegisterState>(
//       buildWhen: (previous, current) => previous.email != current.email,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('signUpForm_emailInput_textField'),
//           onChanged: (email) =>
//               context.read<RegisterCubit>().emailChanged(email),
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             labelText: AppLocalizations.of(context)!.enter_email,
//             errorText: state.email.displayError != null
//                 ? AppLocalizations.of(context)!.invalid_email
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }

// class _PasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterCubit, RegisterState>(
//       buildWhen: (previous, current) => previous.password != current.password,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('signUpForm_passwordInput_textField'),
//           onChanged: (password) =>
//               context.read<RegisterCubit>().passwordChanged(password),
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: AppLocalizations.of(context)!.password,
//             errorText: state.password.displayError != null
//                 ? AppLocalizations.of(context)!.invalid_password
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }

// class _ConfirmPasswordInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterCubit, RegisterState>(
//       buildWhen: (previous, current) =>
//           previous.password != current.password ||
//           previous.confirmedPassword != current.confirmedPassword,
//       builder: (context, state) {
//         return TextField(
//           key: const Key('signUpForm_confirmedPasswordInput_textField'),
//           onChanged: (confirmPassword) => context
//               .read<RegisterCubit>()
//               .confirmedPasswordChanged(confirmPassword),
//           obscureText: true,
//           decoration: InputDecoration(
//             labelText: AppLocalizations.of(context)!.repeat_password,
//             errorText: state.confirmedPassword.displayError != null
//                 ? AppLocalizations.of(context)!.invalid_repeat_password
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }

// class _RegisterButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterCubit, RegisterState>(
//       builder: (context, state) {
//         return state.status.isInProgress
//             ? const CircularProgressIndicator()
//             : ElevatedButton(
//                 key: const Key('signUpForm_continue_raisedButton'),
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   backgroundColor: Colors.orangeAccent,
//                 ),
//                 onPressed: state.isValid
//                     ? () => context.read<RegisterCubit>().signUpFormSubmitted()
//                     : null,
//                 child: Text(AppLocalizations.of(context)!.register),
//               );
//       },
//     );
//   }
// }
