import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitRotatingCircle(
      color: Colors.white,
      size: 30,
    ));
  }
}
