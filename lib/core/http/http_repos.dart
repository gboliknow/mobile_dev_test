import 'package:coinbase_test/core/api/model_api.dart';

class HttpRepos {
  static HttpRepos? _instance;

  HttpRepos._internal() {
    _instance = this;
  }

  factory HttpRepos() => _instance ?? HttpRepos._internal();

  //TODO: add all repos here
  static final CoinsApi coinsApi = CoinsApi();
}
