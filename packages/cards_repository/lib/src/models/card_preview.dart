class CardPreview {
  late int _id;
  late String _name;

  CardPreview.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _name = parsedJson['name'];
  }

  int get id => _id;
  String get name => _name;
}
