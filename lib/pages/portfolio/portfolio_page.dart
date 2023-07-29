import 'package:crypto_watch/controllers/portfolio_controller.dart';
import 'package:crypto_watch/pages/portfolio/widgets/portfolio_card_widget.dart';
import 'package:crypto_watch/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PortfolioController>().updatePortfolioHoldingsValue();
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GetBuilder<PortfolioController>(builder: (portfolioController) {
          String sign = portfolioController.changeInPortfolioPerc < 0 ? '-' : '+';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                '\$${portfolioController.portfolioHoldingsValue}',
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 237, 237, 237)),
              ),
              Text(
                '$sign\$${portfolioController.changeInPortfolioValue.abs()} (${portfolioController.changeInPortfolioPerc}%)',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: portfolioController.changeInPortfolioPerc < 0 ? AppColors.redColor : AppColors.greenColor),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Currencies',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  Text(
                    'Current Value',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: portfolioController.portfolio.length,
                  itemBuilder: (context, index) {
                    var item = portfolioController.portfolio[index];
                    double cryptoUnits = portfolioController.portfolio[index].cryptoUnits;

                    double currentCryptoPrice = portfolioController.isApiActive
                        ? portfolioController.getCryptoPriceFake(item.cryptoShortName)
                        : portfolioController.getCryptoPriceFake(item.cryptoShortName);

                    double cryptoValue = cryptoUnits * currentCryptoPrice;

                    return PortfolioCardWidget(
                      cryptoFullName: item.cryptoFullName,
                      cryptoShortName: item.cryptoShortName,
                      cryptoImage: item.cryptoImage,
                      cryptoUnits: item.cryptoUnits,
                      cryptoAvgPrice: item.cryptoAvgPrice,
                      cryptoValue: cryptoValue,
                    );
                  },
                ),
              )
            ],
          );
        }));
  }
}
