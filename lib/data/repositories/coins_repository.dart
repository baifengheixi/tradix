import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tradix/data/data_providers/coins_provider.dart';
import 'package:tradix/data/models/coins/Coins.dart';

abstract class CR {
  Future<Coins?> getCoins();
}

@Injectable()
class CoinsRepository implements CR {
  final CoinsProvider _coinsProvider;

  CoinsRepository(this._coinsProvider);

  @override
  Future<Coins?> getCoins() async {
    try {
      final response = await _coinsProvider.getCoins();
      var jsonResponse = convert.jsonDecode(response.body);
      Coins coins = Coins.fromJson(jsonResponse);

      return coins;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
