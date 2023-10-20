part of 'auth_widgets.dart';

@immutable
class BtnSubmit extends StatelessWidget {
  const BtnSubmit({super.key, required this.status});

  final Status status;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormsValidate>(builder: (context, state) {
      return state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              width: size.width * REL_TXT_FLD_WIDTH,
              child: OutlinedButton(
                onPressed: !state.isFormValid
                    ? () => context
                        .read<FormBloc>()
                        .add(FormSubmitted(value: status))
                    : null,
                child: Text(AppLocalizations.of(context)?.login ?? ''),
              ),
            );
    });
  }
}
