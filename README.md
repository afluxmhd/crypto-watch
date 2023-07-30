# CryptoWatch

A cryptocurrency app that shows the latest prices of various cryptocurrencies. This app is designed for individuals who are interested in keeping track of the current value of their cryptocurrency investments.

With this app, users can view the real-time prices of popular cryptocurrencies such as Bitcoin, Ethereum, and Litecoin. The app also allows users to track their own portfolio, adding and removing cryptocurrencies as needed.

The app has a clean and user-friendly interface, making it easy for users to quickly check the latest prices and track their portfolio. Additionally, users can set alerts for specific cryptocurrencies to be notified when the price reaches a certain threshold.

## Features

- **Real-Time Price Data:** Get up-to-date prices for popular cryptocurrencies like Bitcoin, Ethereum, and Litecoin.
- **Portfolio Tracking:** Add and remove cryptocurrencies to create a personalized portfolio for easy monitoring.
- **User-Friendly Interface:** The app offers a clean and intuitive interface, making it effortless to check prices and manage your investments.


## Screenshots

<p align="center">
  <img src="https://github.com/afluxmhd/crypto-watch/assets/93920274/ab951d44-527c-4357-908e-9d9588a94227" width="24%" />
  <img src="https://github.com/afluxmhd/crypto-watch/assets/93920274/1ca46d20-ff82-4cf2-961a-7540a604f343" width="24%" />
  <img src="https://github.com/afluxmhd/crypto-watch/assets/93920274/7f842f3a-dcff-414b-89a6-6e89de1b57e6" width="24%" />
 <img src="https://github.com/afluxmhd/crypto-watch/assets/93920274/be461d96-143e-4863-b688-f85feab9fd99" width="24%" />
</p>


## Getting Started

### Prerequisites

To run the CryptoWatch app, you'll need:

- Flutter SDK installed on your development environment.
- An API key from coinapi.com (follow the API Key Setup instructions below).

### Installation

1. Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/afluxmhd/crypto-watch.git
```

2. Navigate to the project directory:

```bash
cd CryptoWatch
```

3. Install the required dependencies:

```
flutter pub get
```

4. Open the project in your preferred Flutter IDE or editor.
5. Add your API key to the app_constants.dart file as described in the API Key Setup section below
6. Run the app on your connected device or emulator:
   
```
flutter run
```

## API Key Setup

To use the CryptoWatch app, you'll need to obtain an API key from coinapi.com. Follow the instructions below to add your API key to the app:

1. Visit [coinapi.io](https://coinapi.io) and sign up for an account (if you haven't already).
2. After signing in, navigate to your account settings to find your API key.
3. Create a new file named app_keys.dart inside the lib/utils folder.
4. Add the following code to the app_keys.dart file
   
```dart
class AppKeys {
  static const String API_KEY = 'YOUR_API_KEY';
}
```
5. Replace 'YOUR_API_KEY' with your actual API key.



