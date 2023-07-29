import 'package:crypto_watch/pages/home/home_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";

  static String getInitial() => initial;

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return const HomePage();
        }),
  ];
}
