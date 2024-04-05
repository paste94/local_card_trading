import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_card_trading/src/repository/card/exceptions/card_exception.dart';
import 'package:local_card_trading/src/repository/card/model/mtg_card.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
part 'provider.g.dart';

const _baseUrl = "api.scryfall.com";

@riverpod
Future<Iterable<MtgCard>> getCardsFromName(
  Ref ref,
  String cardName,
) async {
  final url = Uri.https(_baseUrl, '/cards/search', <String, String?>{
    'q': cardName,
  });
  try {
    final response = await http.get(url);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final List jsonList = json['data'];
    late Iterable<MtgCard> mtgCardList =
        jsonList.map((e) => MtgCard.fromJson(e));
    return mtgCardList;
  } on SocketException catch (_) {
    throw const CardProviderConnectionError();
  }
}
