part of 'auth_widgets.dart';

class TxtRepeatPassword extends StatelessWidget {
  const TxtRepeatPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormsValidate>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * REL_TXT_FLD_WIDTH,
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: ABS_TXT_FLD_VER_CONTENT_PADDING,
                horizontal: ABS_TXT_FLD_HOR_CONTENT_PADDING,
              ),
              helperMaxLines: 2,
              labelText: AppLocalizations.of(context)?.repeat_password ?? '',
              errorMaxLines: 2,
              errorText: !state.isRepeatPasswordValid
                  ? AppLocalizations.of(context)?.repeat_invalid_password ?? ''
                  : null,
            ),
            onChanged: (value) {
              context.read<FormBloc>().add(RepeatPasswordChanged(value));
            },
          ),
        );
      },
    );
  }
}
