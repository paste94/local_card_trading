// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:local_card_trading/src/feature/auth/providers/authentication/authentication_provider.dart';
// import 'package:local_card_trading/src/feature/auth/providers/login/login_provider.dart';

// class LoginView extends ConsumerWidget {
//   const LoginView({super.key});

//   static Page<void> page() => const MaterialPage<void>(child: LoginView());

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(title: Text(AppLocalizations.of(context)!.login)),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Align(
//           alignment: const Alignment(0, -1 / 3),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 16),
//                 _EmailInput(),
//                 const SizedBox(height: 8),
//                 _PasswordInput(),
//                 const SizedBox(height: 16),
//                 _LoginButton(),
//                 const SizedBox(height: 8),
//                 _GoogleLoginButton(),
//                 const SizedBox(height: 4),
//                 _SignUpButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _EmailInput extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return TextField(
//       key: const Key('LoginView_emailInput_textField'),
//       keyboardType: TextInputType.emailAddress,
//       onChanged: (email) =>
//           ref.read(loginProvider.notifier).emailChanged(email),
//       decoration: InputDecoration(
//           labelText: AppLocalizations.of(context)?.enter_email,
//           helperText: '',
//           errorText: ref.watch(loginProvider).email.displayError != null
//               ? AppLocalizations.of(context)?.invalid_password
//               : null),
//     );
//   }
// }

// class _PasswordInput extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return TextField(
//       key: const Key('LoginView_passwordInput_textField'),
//       onChanged: (password) =>
//           ref.read(loginProvider.notifier).passwordChanged(password),
//       obscureText: true,
//       decoration: InputDecoration(
//         labelText: AppLocalizations.of(context)?.password,
//         helperText: '',
//         errorText: ref.watch(loginProvider).password.displayError != null
//             ? AppLocalizations.of(context)?.invalid_password
//             : null,
//       ),
//     );
//   }
// }

// class _LoginButton extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(authenticationProvider).maybeWhen(
//           loading: () => const CircularProgressIndicator(),
//           orElse: () => ElevatedButton(
//             key: const Key('LoginView_continue_raisedButton'),
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               backgroundColor: const Color(0xFFFFD600),
//             ),
//             onPressed: ref.watch(loginProvider).isValid
//                 ? () => {
//                       ref.read(authenticationProvider.notifier).login(
//                             email: ref.read(loginProvider).email.value,
//                             password: ref.read(loginProvider).password.value,
//                           )
//                     }
//                 : null,
//             child: Text(AppLocalizations.of(context)?.login ?? ''),
//           ),
//         );
//   }
// }

// class _GoogleLoginButton extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
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
//       onPressed: () => {},
//     );
//   }
// }

// class _SignUpButton extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final theme = Theme.of(context);
//     return TextButton(
//       key: const Key('LoginView_createAccount_flatButton'),
//       onPressed: () => {},
//       child: Text(
//         AppLocalizations.of(context)?.click_to_register ?? '',
//         style: TextStyle(color: theme.primaryColor),
//       ),
//     );
//   }
// }
