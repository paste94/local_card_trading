part of 'auth_widgets.dart';

class TxtDispalyName extends StatelessWidget {
  const TxtDispalyName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormsValidate>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * REL_TXT_FLD_WIDTH,
          child: TextFormField(
              onChanged: (value) {
                context.read<FormBloc>().add(NameChanged(value));
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.name ?? '',
                errorText: !state.isNameValid
                    ? AppLocalizations.of(context)?.invalid_name ?? ''
                    : null,
                hintText: AppLocalizations.of(context)?.name ?? '',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: ABS_TXT_FLD_VER_CONTENT_PADDING,
                  horizontal: ABS_TXT_FLD_HOR_CONTENT_PADDING,
                ),
              )),
        );
      },
    );
  }
}
