part of 'auth_widgets.dart';

class TxtBirthDate extends StatefulWidget {
  const TxtBirthDate({super.key});

  @override
  State<TxtBirthDate> createState() => _TxtBirthDateState();
}

var _birthDateController = TextEditingController();
DateTime? _selectedDate;

class _TxtBirthDateState extends State<TxtBirthDate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String dateFormat =
        AppLocalizations.of(context)?.date_format ?? 'dd/MM/yyyy';

    return BlocBuilder<FormBloc, FormsValidate>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * REL_TXT_FLD_WIDTH,
          child: TextFormField(
            controller: _birthDateController,
            readOnly: true,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              ).then((selectedDate) {
                print('CHANGED');
                if(selectedDate != null){
                  _birthDateController.text = DateFormat(dateFormat).format(selectedDate);
                  context.read<FormBloc>().add(BirthDateChanged(selectedDate));
                }
              });
              // _selectedDate = await showDatePicker(
              //   context: context,
              //   initialDate: DateTime.now(),
              //   firstDate: DateTime(1900),
              //   lastDate: DateTime.now(),
              // );
              // if (_selectedDate != null) {
              //   _birthDateController.text =
              //       DateFormat(dateFormat).format(_selectedDate!);
              //   context.read<FormBloc>().add(BirthDateChanged(_selectedDate!));
              // }
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)?.birth_date,
              errorText: !state.isBirthDateValid
                  ? AppLocalizations.of(context)?.invalid_birth_date
                  : null,
              hintText: AppLocalizations.of(context)?.birth_date,
              contentPadding: const EdgeInsets.symmetric(
                vertical: ABS_TXT_FLD_VER_CONTENT_PADDING,
                horizontal: ABS_TXT_FLD_HOR_CONTENT_PADDING,
              ),
            ),
          ),
        );
      },
    );
  }
}
