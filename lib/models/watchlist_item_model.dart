// ignore_for_file: public_member_api_docs, sort_constructors_first
class WatchListItemModel {
  WatchListItemModel({
    required this.cryptoPrice,
    required this.cryptoChange,
    required this.cryptoFullName,
    required this.cryptoShortForm,
  });

  final String cryptoFullName;
  final String cryptoShortForm;
  final double cryptoPrice;
  final double cryptoChange;
}
