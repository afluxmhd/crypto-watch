import 'package:crypto_watch/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PortfolioCardWidget extends StatelessWidget {
  const PortfolioCardWidget(
      {super.key,
      required this.cryptoFullName,
      required this.cryptoShortName,
      required this.cryptoImage,
      required this.cryptoUnits,
      required this.cryptoAvgPrice,
      required this.cryptoValue});

  final String cryptoFullName;
  final String cryptoShortName;
  final String cryptoImage;
  final double cryptoUnits;
  final double cryptoAvgPrice;
  final double cryptoValue;

  double roundToPrecision(double number, int decimalPlaces) {
    return double.parse(number.toStringAsFixed(decimalPlaces));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
      height: 80,
      width: 400,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Image.asset(cryptoImage),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cryptoFullName,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                      Text(
                        'Qty. $cryptoUnits',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$${roundToPrecision(cryptoValue, 2)}',
                      style:
                          const TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 255, 255, 255))),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Avg. \$${roundToPrecision(cryptoAvgPrice, 2)}',
                      style:
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color.fromARGB(255, 225, 220, 220))),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
