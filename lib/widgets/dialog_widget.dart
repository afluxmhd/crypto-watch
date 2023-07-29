import 'package:crypto_watch/data/crypto/crypto_images.dart';
import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key, required this.cryptoName, required this.cryptoPrice});

  final String cryptoName;
  final double cryptoPrice;

  Future<dynamic> showDialogWidget(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), //this right here
          child: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      CryptoImages().getImages(cryptoName),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 25),
                  cryptoPrice != 0
                      ? Text(
                          cryptoName,
                          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                        )
                      : const Text(
                          "Couldn't fetch Data",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$${cryptoPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
