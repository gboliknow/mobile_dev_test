import 'package:coinbase_test/core/http/http_repos.dart';
import 'package:coinbase_test/model/coin.dart';
import 'package:flutter/material.dart';

class CoinsProvider extends ChangeNotifier {
  List<CoinModel>? coins = [];

  coinsList() async {
    await HttpRepos.coinsApi.getCoins().then((value) {
      coins = value;
    });
    notifyListeners();
  }
}
