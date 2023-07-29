class CryptoImages {
  String getImages(String cryptoShortName) {
    if (cryptoShortName == 'BTC') {
      return "assets/bitcoin.png";
    } else if (cryptoShortName == 'ETH') {
      return "assets/ether.png";
    } else if (cryptoShortName == 'SOL') {
      return 'assets/solano.png';
    } else if (cryptoShortName == 'DOGE') {
      return 'assets/dogecoin.png';
    } else if (cryptoShortName == 'USDT') {
      return 'assets/tether.png';
    } else if (cryptoShortName == 'ADA') {
      return 'assets/cardano.png';
    } else if (cryptoShortName == 'SHIB') {
      return 'assets/shiba inu.png';
    } else if (cryptoShortName == 'XRP') {
      return 'assets/xrp.png';
    } else if (cryptoShortName == 'DOT') {
      return 'assets/polkadot.png';
    } else if (cryptoShortName == 'LTC') {
      return 'assets/litecoin.png';
    } else if (cryptoShortName == 'XLM') {
      return 'assets/stellar.png';
    } else if (cryptoShortName == 'USDC') {
      return 'assets/usdc.png';
    } else if (cryptoShortName == 'MATIC') {
      return 'assets/polygon.png';
    } else {
      return 'assets/error_image-removebg-preview.png';
    }
  }
}
