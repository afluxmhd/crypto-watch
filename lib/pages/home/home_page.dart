import 'package:crypto_watch/controllers/portfolio_controller.dart';
import 'package:crypto_watch/controllers/watchlist_controller.dart';
import 'package:crypto_watch/data/crypto/crypto_images.dart';
import 'package:crypto_watch/data/crypto/crypto_names.dart';
import 'package:crypto_watch/models/portfolio_item_model.dart';
import 'package:crypto_watch/pages/portfolio/portfolio_page.dart';
import 'package:crypto_watch/pages/watchlist/watchlist_page.dart';
import 'package:crypto_watch/utils/app_colors.dart';
import 'package:crypto_watch/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget implements PreferredSizeWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [WatchlistPage(), PortfolioPage()];
  int _currentScreen = 0;

  final TextEditingController cryptoNameController = TextEditingController();
  final TextEditingController cryptoAvgPriceController = TextEditingController();
  final TextEditingController cryptoUnitController = TextEditingController();

  void getCurrentScreen(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  String getAppBarTitle() {
    if (_currentScreen == 0) {
      return 'Watchlist';
    } else {
      return 'Portfolio';
    }
  }

  IconData getAppBarActionIcon() {
    if (_currentScreen == 0) {
      return Icons.refresh_outlined;
    } else {
      return Icons.add;
    }
  }

  void updateWatchlist() {
    Get.find<WatchlistController>().getWatchlistData();
    Get.find<PortfolioController>().getCryptoPrice('BTC'); //fake instance initialize to avoid crash in app
  }

  void addToPortfolio(BuildContext context) {
    BottomSheetWidget(
            onPressed: () {
              if (cryptoNameController.text.isNotEmpty) {
                Get.find<PortfolioController>().addToPortfolio(PortfolioItemModel(
                    cryptoFullName: CryptoNames().getFullCryptoName(cryptoNameController.text.toUpperCase()),
                    cryptoShortName: cryptoNameController.text.toUpperCase(),
                    cryptoImage: CryptoImages().getImages(cryptoNameController.text.toUpperCase()),
                    cryptoUnits: double.parse(cryptoUnitController.text),
                    cryptoAvgPrice: double.parse(cryptoAvgPriceController.text)));
              }
              cryptoNameController.clear();
              cryptoAvgPriceController.clear();
              cryptoUnitController.clear();
              Get.back();
            },
            cryptoNameController: cryptoNameController,
            cryptoAvgPriceController: cryptoAvgPriceController,
            cryptoUnitController: cryptoUnitController)
        .openBottomSheet(context);
  }

  @override
  void initState() {
    updateWatchlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: widget.preferredSize,
          child: GetBuilder<WatchlistController>(builder: (watchlistController) {
            return AppBarWidget(
              actionIcon: getAppBarActionIcon(),
              title: getAppBarTitle(),
              actionOnTap: () {
                if (_currentScreen == 0) {
                  updateWatchlist();
                } else {
                  addToPortfolio(context);
                }
              },
              isApiActive: watchlistController.isApiActive,
              leadingOnTap: (value) {
                watchlistController.setApiStatus(value);
                Get.find<PortfolioController>().setApiStatus(value);

                var snackBar = SnackBar(
                  content: Text(
                    value ? 'API Activated' : 'API Deactivated',
                    style: TextStyle(color: AppColors.primaryTextColor),
                  ),
                  backgroundColor: AppColors.secondaryColor,
                  duration: const Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            );
          })),
      body: _pages[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: getCurrentScreen,
        currentIndex: _currentScreen,
        selectedItemColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_travel_sharp),
            label: 'Portfolio',
          ),
        ],
      ),
    );
  }
}
