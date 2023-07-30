import 'package:crypto_watch/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../utils/app_keys.dart';
import '../api/api_client.dart';

class CryptoRepo {
  CryptoRepo({required this.apiClient});
  final ApiClient apiClient;

  Future<Response> updateCryptoPrice(String cryptoShortName) async {
    return apiClient.getData('${AppConstants.EXCHANGE_RATE_PATH + cryptoShortName}/USD?apikey=${AppKeys.API_KEY}');
  }
}
