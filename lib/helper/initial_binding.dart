import 'package:get/get.dart';
import 'package:crypto_watch/controllers/portfolio_controller.dart';
import 'package:crypto_watch/controllers/watchlist_controller.dart';
import 'package:crypto_watch/data/api/api_client.dart';
import 'package:crypto_watch/data/repository/crypto_repo.dart';
import 'package:crypto_watch/utils/app_constants.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

    //repos
    Get.lazyPut(() => CryptoRepo(apiClient: Get.find()));

    //controllers
    Get.lazyPut(() => WatchlistController(cryptoRepo: Get.find()));
    Get.lazyPut(() => PortfolioController(cryptoRepo: Get.find()));
  }
}
