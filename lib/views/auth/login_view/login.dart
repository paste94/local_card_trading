import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/bloc/auth/authentication_bloc.dart';
import 'package:local_card_trading/bloc/form/form_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_card_trading/constants/routes.dart';
import 'package:local_card_trading/utils/dialogs.dart';
import 'package:local_card_trading/views/auth/register_view/register.dart';
import 'package:local_card_trading/views/home/home.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FormBloc, FormsValidate>(listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            showErrorDialog(context, state.errorMessage);
          } else if (state.isFormValid && !state.isLoading) {
            context.read<AuthenticationBloc>().add(AuthenticationStarted());
            context.read<FormBloc>().add(const FormSucceeded());
          } else if (state.isFormValidateFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Form not valid')));
          }
        }),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeView()),
                  (Route<dynamic> route) => false);
            }
          },
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).login),
          ),
          body: const Center(
              child: Column(
            children: [
              _EmailField(),
              _PasswordField(),
              _SubmitButton(),
              _GoToRegisterView(),
              _SignInNavigate(),
            ],
          ))),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormsValidate>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * 0.8,
          child: TextFormField(
              onChanged: (value) {
                context.read<FormBloc>().add(EmailChanged(value));
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                helperText: 'A complete, valid email e.g. joe@gmail.com',
                errorText: !state.isEmailValid
                    ? 'Please ensure the email entered is valid'
                    : null,
                hintText: 'Email',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
              )),
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormsValidate>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * 0.8,
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              helperText:
                  '''Password should be at least 8 characters with at least one letter and number''',
              helperMaxLines: 2,
              labelText: 'Password',
              errorMaxLines: 2,
              errorText: !state.isPasswordValid
                  ? '''Password must be at least 8 characters and contain at least one letter and number'''
                  : null,
            ),
            onChanged: (value) {
              context.read<FormBloc>().add(PasswordChanged(value));
            },
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormsValidate>(builder: (context, state) {
      return state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: size.width * 0.8,
              child: OutlinedButton(
                onPressed: !state.isFormValid
                    ? () => context
                        .read<FormBloc>()
                        .add(const FormSubmitted(value: Status.signUp))
                    : null,
                child: Text(AppLocalizations.of(context).login),
              ),
            );
    });
  }
}

class _GoToRegisterView extends StatelessWidget {
  const _GoToRegisterView();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormsValidate>(builder: (context, state) {
      return state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              width: size.width * 0.8,
              child: OutlinedButton(
                onPressed: !state.isFormValid
                    ? () => Navigator.of(context).pushNamed(ROUTE_REGISTER)
                    : null,
                child: Text(AppLocalizations.of(context).click_to_register),
              ),
            );
    });
  }
}

class _SignInNavigate extends StatelessWidget {
  const _SignInNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: <TextSpan>[
          const TextSpan(
            text: 'Constants.textAcc',
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => {
                    Navigator.of(context).pop(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterView()),
                    )
                  },
            text: 'Constants.textSignUp',
          ),
        ]));
  }
}
