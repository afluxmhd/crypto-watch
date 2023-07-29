// ignore_for_file: must_be_immutable

import 'package:crypto_watch/base/splash_page.dart';
import 'package:crypto_watch/controllers/watchlist_controller.dart';
import 'package:crypto_watch/data/crypto/crypto_images.dart';
import 'package:crypto_watch/pages/watchlist/widgets/watchlist_card_widget.dart';
import 'package:crypto_watch/pages/watchlist/widgets/watchlist_search_bar_widget.dart';
import 'package:crypto_watch/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  TextEditingController searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WatchlistController>(builder: (watchlistController) {
      return ModalProgressHUD(
        progressIndicator: const SplashPage(),
        color: const Color(0xFF001427),
        opacity: 0.7,
        inAsyncCall: watchlistController.isLoading,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
          child: Column(
            children: [
              Column(
                children: [
                  WatchlistSearchBarWidget(
                    controller: searchbarController,
                    hintText: 'Enter Ticker',
                    onPressed: () async {
                      if (searchbarController.text.isNotEmpty) {
                        String cryptoShortName = searchbarController.text.toUpperCase();
                        double cryptoPrice = watchlistController.getCryptoPriceFake(cryptoShortName);
                        DialogWidget(cryptoName: cryptoShortName, cryptoPrice: cryptoPrice).showDialogWidget(context);
                        searchbarController.clear();
                      }
                    },
                  ),
                ],
              ),
              Expanded(
                flex: 4,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: watchlistController.watchlist.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                    itemBuilder: (context, index) {
                      return WatchlistCardWidget(
                          coinFullName: watchlistController.watchlist[index].cryptoFullName,
                          coinShortForm: watchlistController.watchlist[index].cryptoShortForm,
                          coinImage: CryptoImages().getImages(watchlistController.watchlist[index].cryptoShortForm),
                          coinPrice: watchlistController.watchlist[index].cryptoPrice.roundToDouble().toString(),
                          coinPriceChange: watchlistController.watchlist[index].cryptoChange.toString());
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
