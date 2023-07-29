import 'dart:core';
import 'package:crypto_watch/data/crypto/crypto_names.dart';
import 'package:crypto_watch/data/repository/crypto_repo.dart';
import 'package:crypto_watch/models/watchlist_item_model.dart';
import 'package:get/get.dart';

class WatchlistController extends GetxController {
  WatchlistController({required this.cryptoRepo});
  final CryptoRepo cryptoRepo;

  List<WatchListItemModel> get watchlist => _watchlist;
  bool get isLoading => _isLoading;
  bool get isApiActive => _isApiActive;

  List<WatchListItemModel> _watchlist = [];
  bool _isLoading = false;
  bool _isApiActive = false;

  void getWatchlistData() async {
    _isLoading = true;
    update();
    _watchlist = [];
    if (_isApiActive) {
      //API
      for (int i = 0; i < CryptoNames.cryptoShortNameList.length; i++) {
        Response response = await cryptoRepo.updateCryptoPrice(CryptoNames.cryptoShortNameList[i]);
        if (response.statusCode == 200) {
          var body = response.body;
          double cryptoPrice = body['rate'];
          _watchlist.add(WatchListItemModel(
              cryptoPrice: cryptoPrice,
              cryptoChange: 1.2,
              cryptoFullName: CryptoNames().getFullCryptoName(CryptoNames.cryptoShortNameList[i]),
              cryptoShortForm: CryptoNames.cryptoShortNameList[i]));
        } else if (response.statusCode == 429) {
          print('Try Tommorow');
        } else if (response.statusCode == 550) {
          print('Not avaialble');
        } else {
          print(response.statusCode);
        }
      }
      print('Watchlist updated(API)');
    } else {
      //No API
      for (int i = 0; i < CryptoNames.cryptoShortNameList.length; i++) {
        double cryptoPrice = getCryptoPriceFake(CryptoNames.cryptoShortNameList[i]);
        _watchlist.add(WatchListItemModel(
            cryptoPrice: cryptoPrice,
            cryptoChange: 1.2,
            cryptoFullName: CryptoNames().getFullCryptoName(CryptoNames.cryptoShortNameList[i]),
            cryptoShortForm: CryptoNames.cryptoShortNameList[i]));
      }
      print('Fake watchlist updated');
    }
    _isLoading = false;
    update();
  }

  void setApiStatus(bool value) {
    _isApiActive = value;
    getWatchlistData();
    update();
  }

  //Use this fake data (method) to fetch crypto price to avoid API limits
  double getCryptoPriceFake(String cryptoShortName) {
    if (cryptoShortName == 'BTC') {
      return 1200.00;
    } else if (cryptoShortName == 'ETH') {
      return 500.00;
    } else if (cryptoShortName == 'SOL') {
      return 203.00;
    } else if (cryptoShortName == 'DOGE') {
      return 2.00;
    } else if (cryptoShortName == 'USDT') {
      return 1.00;
    } else if (cryptoShortName == 'ADA') {
      return 3.20;
    } else if (cryptoShortName == 'SHIB') {
      return 0.10;
    } else if (cryptoShortName == 'XRP') {
      return 1.20;
    } else if (cryptoShortName == 'DOT') {
      return 0.80;
    } else if (cryptoShortName == 'LTC') {
      return 2.00;
    } else if (cryptoShortName == 'XLM') {
      return 23.00;
    } else if (cryptoShortName == 'USDC') {
      return 54.00;
    } else if (cryptoShortName == 'MATIC') {
      return 33.30;
    } else {
      return 1.00;
    }
  }

  //Use this data (method) to fetch actual crypto price from API
  Future<double> getCryptoPrice(String cryptoShortName) async {
    Response response = await cryptoRepo.updateCryptoPrice(cryptoShortName);
    if (response.statusCode == 200) {
      var body = response.body;
      double cryptoPrice = body['rate'];
      return cryptoPrice;
    } else if (response.statusCode == 429) {
      print('Try Tommorow');
      return 0.0;
    } else if (response.statusCode == 550) {
      print('Not avaialble');
      return 0.0;
    } else {
      print(response.statusCode);
      return 0.0;
    }
  }
}
