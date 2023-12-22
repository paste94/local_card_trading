class MtgSet {
  late int _id;
  late String _name;
  late Uri _iconUri;

  MtgSet.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _name = parsedJson['name'];
    _iconUri = parsedJson['icon_svg_uri'];
  }

  int get id => _id;
  String get name => _name;
  Uri get iconUri => _iconUri;
}
