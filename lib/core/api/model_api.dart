import 'package:coinbase_test/core/http/http_client.dart';
import 'package:coinbase_test/model/coin.dart';

class CoinsApi {
  final HttpClient _http = HttpClient();

  Future<List<CoinModel>> getCoins() async {
    final response = await _http.getRequest(
        'coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');

    return (response.body as List)
        .map((coins) => CoinModel.fromMap(coins))
        .toList()
        .cast<CoinModel>();
  }
}
