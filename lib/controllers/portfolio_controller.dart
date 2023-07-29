import 'package:crypto_watch/models/portfolio_item_model.dart';
import 'package:get/get.dart';

import 'package:crypto_watch/data/repository/crypto_repo.dart';

class PortfolioController extends GetxController {
  final CryptoRepo cryptoRepo;
  PortfolioController({required this.cryptoRepo});

  List<PortfolioItemModel> get portfolio => _portfolio;
  double get changeInPortfolioValue => _changeInPortfolioValue.roundToDouble();
  double get portfolioHoldingsValue => _portfolioHoldingsValue.roundToDouble();
  double get changeInPortfolioPerc => _changeInPortfolioPerc.roundToDouble();
  bool get isApiActive => _isApiActive;
  bool get isLoading => _isLoading;

  final List<PortfolioItemModel> _portfolio = [];
  double _changeInPortfolioValue = 0;
  double _portfolioHoldingsValue = 0;
  double _boughtValueOfAllCrypto = 0;
  double _changeInPortfolioPerc = 0;
  bool _isApiActive = false;
  bool _isLoading = false;

  void addToPortfolio(PortfolioItemModel item) {
    for (int i = 0; i < _portfolio.length; i++) {
      if (portfolio[i].cryptoShortName == item.cryptoShortName) {
        double newAvgPrice = (_portfolio[i].cryptoAvgPrice + item.cryptoAvgPrice) / 2;
        item.cryptoAvgPrice = newAvgPrice; //set new avg price
        item.cryptoUnits = item.cryptoUnits + _portfolio[i].cryptoUnits; //set new units
        _portfolio.remove(_portfolio[i]); //Old item removed after collecting units and avg price
        _portfolio.add(item); //added new item with updated avg and unit values
        update();
        return;
      }
    }
    _portfolio.add(item);
    update();
  }

  void updatePortfolioHoldingsValue() async {
    _portfolioHoldingsValue = 0;
    if (_isApiActive) {
      //API
      _isLoading = true;
      update();
      for (final item in _portfolio) {
        double currentCryptoPrice = await getCryptoPrice(item.cryptoShortName);

        double cryptoValue = item.cryptoUnits * currentCryptoPrice;
        _portfolioHoldingsValue += cryptoValue;
      }
      print('Portfolio Value Updated(API)');
      _isLoading = false;
    } else {
      //No API
      for (final item in _portfolio) {
        double cryptoValue = item.cryptoUnits * getCryptoPriceFake(item.cryptoShortName); //fake API Call
        _portfolioHoldingsValue += cryptoValue;
      }
      print('Fake Portfolio Value Updated');
    }
    _getChangeInPortfolio();
    update();
  }

  void _getChangeInPortfolio() async {
    _changeInPortfolioValue = 0;
    _boughtValueOfAllCrypto = 0;

    if (_isApiActive) {
      //API
      _isLoading = true;
      update();
      for (final item in _portfolio) {
        double units = item.cryptoUnits;
        double avgPrice = item.cryptoAvgPrice;

        double currentCryptoPrice = await getCryptoPrice(item.cryptoShortName);
        double currentCryptoValue = units * currentCryptoPrice;
        double boughtValue = units * avgPrice;
        _boughtValueOfAllCrypto +=
            boughtValue; //Adding bought value of single crypto to another var to store all crypto bought value

        double changeInValue = currentCryptoValue - boughtValue; //Change in value of one crypto
        _changeInPortfolioValue += changeInValue;
      }
      _isLoading = false;
    } else {
      //No API
      for (final item in _portfolio) {
        double units = item.cryptoUnits;
        double avgPrice = item.cryptoAvgPrice;

        double currentCryptoValue = units * getCryptoPriceFake(item.cryptoShortName);
        double boughtValue = units * avgPrice;
        _boughtValueOfAllCrypto +=
            boughtValue; //Adding bought value of single crypto to another var to store all crypto bought value

        double changeInValue = currentCryptoValue - boughtValue; //Change in value of one crypto
        _changeInPortfolioValue += changeInValue;
      }
    }
    _getChangePercentageOfPortfolio();
    update();
  }

  void _getChangePercentageOfPortfolio() {
    double calculatePercentageChange(double oldValue, double newValue) {
      double change = newValue - oldValue;
      double percentageChange = (change / oldValue) * 100;
      return percentageChange;
    }

    _changeInPortfolioPerc = calculatePercentageChange(_boughtValueOfAllCrypto, _portfolioHoldingsValue);
    _changeInPortfolioPerc = _changeInPortfolioPerc.isNaN ? 0.0 : _changeInPortfolioPerc;
    update();
  }

  void setApiStatus(bool value) {
    _isApiActive = value;
    updatePortfolioHoldingsValue();
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
      print(response.statusText);
      return 0.0;
    }
  }
}
