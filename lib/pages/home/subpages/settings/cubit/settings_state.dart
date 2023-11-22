part of 'settings_cubit.dart';

final class SettingsState extends Equatable {
  const SettingsState({
    this.name = const Name.pure(),
  });

  final Name name;

  @override
  List<Object> get props => [name];
  SettingsState copyWith({Name? name}) {
    return SettingsState(
      name: name ?? this.name,
    );
  }
}
