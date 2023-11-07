part of 'auth_widgets.dart';

class TxtEmail extends StatelessWidget {
  const TxtEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormsValidate>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * REL_TXT_FLD_WIDTH,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)?.enter_email ?? '',
              errorText: !state.isEmailValid
                  ? AppLocalizations.of(context)?.invalid_email ?? ''
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                vertical: ABS_TXT_FLD_VER_CONTENT_PADDING,
                horizontal: ABS_TXT_FLD_HOR_CONTENT_PADDING,
              ),
            ),
            onChanged: (value) {
              context.read<FormBloc>().add(EmailChanged(value));
            },
          ),
        );
      },
    );
  }
}
