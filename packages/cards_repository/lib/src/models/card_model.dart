import 'package:equatable/equatable.dart';

import 'models.dart';

class MtgCard extends Equatable {
  late String _id;
  late String _language;
  late String _name;
  late String _setName;

  MtgCard.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson);
    _id = parsedJson['id'];
    _language = parsedJson['lang'];
    _name = parsedJson['name'];
    _setName = parsedJson['set_name'];
  }

  String get id => _id;
  String get language => _language;
  String get name => _name;
  String get setName => _setName;

  @override
  // TODO: implement props
  List<Object?> get props => [
        _id,
        _language,
        _name,
        _setName,
      ];
}
