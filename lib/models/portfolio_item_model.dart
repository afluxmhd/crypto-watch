// ignore_for_file: public_member_api_docs, sort_constructors_first
class PortfolioItemModel {
  PortfolioItemModel({
    required this.cryptoFullName,
    required this.cryptoShortName,
    required this.cryptoImage,
    required this.cryptoUnits,
    required this.cryptoAvgPrice,
  });
  final String cryptoFullName;
  final String cryptoShortName;
  final String cryptoImage;
  double cryptoUnits;
  double cryptoAvgPrice;
}
