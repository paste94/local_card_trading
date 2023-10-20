part of 'auth_widgets.dart';

class BtnRegister extends StatelessWidget {
  const BtnRegister({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * REL_TXT_FLD_WIDTH,
      child: OutlinedButton(
        onPressed: () => Navigator.of(context).pushNamed(ROUTE_REGISTER),
        child: Text(AppLocalizations.of(context)?.click_to_register ?? ''),
      ),
    );
  }
}
