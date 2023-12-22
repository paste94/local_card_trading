import 'models.dart';

class Card {
  late int _id;
  late String _language;
  late String _name;
  late MtgSet mtgSet;

  Card.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _language = parsedJson['lang'];
    _name = parsedJson['name'];
  }

  int get id => _id;
  String get language => _language;
  String get name => _name;
}
