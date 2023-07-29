import 'package:crypto_watch/utils/app_colors.dart';
import 'package:flutter/material.dart';

class WatchlistCardWidget extends StatelessWidget {
  const WatchlistCardWidget(
      {super.key,
      required this.coinFullName,
      required this.coinShortForm,
      required this.coinImage,
      required this.coinPrice,
      required this.coinPriceChange});

  final String coinFullName;
  final String coinShortForm;
  final String coinImage;
  final String coinPrice;
  final String coinPriceChange;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 28, 36, 48),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  coinImage,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coinFullName,
                      style: TextStyle(color: AppColors.primaryTextColor, fontSize: 20),
                    ),
                    Text(coinShortForm, style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 16))
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$$coinPrice',
                      style: TextStyle(color: AppColors.primaryTextColor, fontSize: 17),
                    ),
                    SizedBox(height: 2),
                    Text('$coinPriceChange%', style: TextStyle(color: AppColors.greenColor, fontSize: 16))
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
