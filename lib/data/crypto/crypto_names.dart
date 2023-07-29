class CryptoNames {
  static List<String> cryptoFullNameList = ['Bitcoin', 'Ethereum', 'Solana', 'Tether', 'Cardano', 'Doge', 'Stellar', 'Polygon'];
  static List<String> cryptoShortNameList = ['BTC', 'ETH', 'SOL', 'USDT', 'ADA', 'DOGE', 'XLM', 'MATIC'];

  String getFullCryptoName(String cryptoShortName) {
    if (cryptoShortName == 'BTC') {
      return cryptoFullNameList[0];
    } else if (cryptoShortName == 'ETH') {
      return cryptoFullNameList[1];
    } else if (cryptoShortName == 'SOL') {
      return cryptoFullNameList[2];
    } else if (cryptoShortName == 'USDT') {
      return cryptoFullNameList[3];
    } else if (cryptoShortName == 'ADA') {
      return cryptoFullNameList[4];
    } else if (cryptoShortName == 'DOGE') {
      return cryptoFullNameList[5];
    } else if (cryptoShortName == 'XLM') {
      return cryptoFullNameList[6];
    } else if (cryptoShortName == 'MATIC') {
      return cryptoFullNameList[7];
    } else {
      return 'Crypto';
    }
  }

  String getShortCryptoName(String cryptoFullName) {
    if (cryptoFullName == 'Bitcoin') {
      return cryptoShortNameList[0];
    } else if (cryptoFullName == 'Ethereum') {
      return cryptoShortNameList[1];
    } else if (cryptoFullName == 'Solana') {
      return cryptoShortNameList[2];
    } else if (cryptoFullName == 'Tether') {
      return cryptoShortNameList[3];
    } else if (cryptoFullName == 'Cardano') {
      return cryptoShortNameList[4];
    } else if (cryptoFullName == 'Doge') {
      return cryptoShortNameList[5];
    } else if (cryptoFullName == 'Stellar') {
      return cryptoShortNameList[6];
    } else if (cryptoFullName == 'Polygon') {
      return cryptoShortNameList[7];
    } else {
      return 'CRYPTO';
    }
  }
}
