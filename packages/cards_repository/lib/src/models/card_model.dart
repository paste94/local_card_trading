/// https://scryfall.com/docs/api/cards
class MtgCard {
  late String _id;
  late String _language;
  late String _name;
  late String _setName;
  late Uri _imageUri;
  late Uri _imageUriSmall;

  MtgCard() {
    this._imageUriSmall = Uri.parse('');
    this._setName = '';
  }

  MtgCard.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _language = parsedJson['lang'];
    _name = parsedJson['name'];
    _setName = parsedJson['set_name'];
    _imageUri = Uri.parse(parsedJson['image_uris']['normal']);
    _imageUriSmall = Uri.parse(parsedJson['image_uris']['small']);
    _setName = parsedJson['set_name'];
  }

  String get id => _id;
  String get language => _language;
  String get name => _name;
  String get setName => _setName;
  Uri get imageUri => _imageUri;
  Uri get imageUriSmall => _imageUriSmall;

  @override
  String toString() {
    return '{id: $_id, language: $_language, name: $_name, setName: $_setName}';
  }
}
