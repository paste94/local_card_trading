import 'dart:convert';

import 'package:cards_repository/src/models/card_model.dart';
import 'package:http/http.dart' show Client;

class CardsProvider {
  Client client = Client();
  final _baseUrl = "api.scryfall.com";
  final Client _httpClient = Client();

  Future<Iterable<String>> autoCompleteCardName(String query) async {
    final url = Uri.https(_baseUrl, '/cards/autocomplete', <String, String?>{
      'q': query,
      'include_extras': 'true',
    });
    final response = await _httpClient.get(url);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    Iterable<dynamic> list = json['data'];
    Iterable<String> stringList = Iterable.castFrom<dynamic, String>(list);
    return stringList;
  }

  Future<void> getCardsFromName(String query) async {
    final url = Uri.https(_baseUrl, '/cards/search', <String, String?>{
      'q': query,
      'unique': 'prints',
    });
    final response = await _httpClient.get(url);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final List jsonList = json['data'];
    Iterable<MtgCard> mtgCardList = jsonList.map((e) => MtgCard.fromJson(e));
    print('***listOfJson***: ${mtgCardList.map((e) => e.setName)}');
  }
}