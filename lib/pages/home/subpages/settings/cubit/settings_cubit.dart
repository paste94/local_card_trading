import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_card_trading/widgets/name.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
}
