/// https://scryfall.com/docs/api/cards
class MtgCard {
  late String _id;
  late String _language;
  late String _name;
  late String _setName;
  late List<Uri> _imageUri;
  late List<Uri> _imageUriSmall;

  MtgCard.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _language = parsedJson['lang'];
    _name = parsedJson['name'];
    _setName = parsedJson['set_name'];
    List<Uri> uris = [];
    List<Uri> uris_sm = [];
    if (parsedJson.containsKey("image_uris")) {
      uris.add(Uri.parse(parsedJson['image_uris']['normal'] ?? ''));
      uris_sm.add(Uri.parse(parsedJson['image_uris']['small'] ?? ''));
    } else {
      var card_faces = parsedJson['card_faces'];
      for (var elem in card_faces) {
        print('ELEM ${elem['image_uris']}');
        try {
          uris.add(Uri.parse(elem['image_uris']['normal'] ?? ''));
          uris_sm.add(Uri.parse(elem['image_uris']['small'] ?? ''));
        } catch (e) {
          print('EEEEEEE ${parsedJson}');
        }
      }
    }
    _imageUri = uris;
    _imageUriSmall = uris_sm;
    _setName = parsedJson['set_name'];
  }

  String get id => _id;
  String get language => _language;
  String get name => _name;
  String get setName => _setName;
  List<Uri> get imageUri => _imageUri;
  List<Uri> get imageUriSmall => _imageUriSmall;

  @override
  String toString() {
    return '{id: $_id, language: $_language, name: $_name, setName: $_setName}';
  }
}
