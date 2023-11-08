part of 'auth_widgets.dart';

class BtnGoTo extends StatelessWidget {
  const BtnGoTo({
    super.key,
    required this.route,
  });

  final String route;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String? text = route == ROUTE_REGISTER
        ? AppLocalizations.of(context)?.click_to_register
        : AppLocalizations.of(context)?.click_to_log_in;
    return SizedBox(
      width: size.width * REL_TXT_FLD_WIDTH,
      child: OutlinedButton(
        onPressed: () {
          context.read<FormBloc>().add(const PasswordChanged(''));
          context.read<FormBloc>().add(const EmailChanged(''));
          context.read<FormBloc>().add(const RepeatPasswordChanged(''));
          context.read<FormBloc>().add(const NameChanged(''));
          context.read<FormBloc>().add(const BirthDateChanged(null));
          Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
        },
        child: Text(text ?? ''),
      ),
    );
  }
}
