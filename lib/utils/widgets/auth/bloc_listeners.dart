part of 'auth_widgets.dart';

final formBlocListener = BlocListener<FormBloc, FormsValidate>(
  listener: (context, state) {
    if (state.errorMessage.isNotEmpty) {
      showErrorDialog(context, state.errorMessage);
    } else if (state.isFormValid && !state.isLoading) {
      context.read<AuthenticationBloc>().add(AuthenticationStarted());
      context.read<FormBloc>().add(const FormSucceeded());
    } else if (state.isFormValidateFailed) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Form not valid')));
    }
  },
);

final authBlocListener = BlocListener<AuthenticationBloc, AuthenticationState>(
  listener: (context, state) {
    if (state is AuthenticationSuccess) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(ROUTE_HOME, (route) => false);
    }
  },
);
