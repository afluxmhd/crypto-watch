import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:crypto_watch/data/crypto/crypto_names.dart';
import 'package:flutter/material.dart';

class PortfolioCryptoTextField extends StatefulWidget {
  const PortfolioCryptoTextField({super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  State<PortfolioCryptoTextField> createState() => _PortfolioCryptoTextFieldState();
}

class _PortfolioCryptoTextFieldState extends State<PortfolioCryptoTextField> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9, bottom: 15),
      child: AutoCompleteTextField(
        key: key,
        clearOnSubmit: false,
        controller: widget.controller,
        itemSorter: (a, b) {
          return a.hashCode.compareTo(b.hashCode);
        },
        itemFilter: (item, query) {
          return item.toString().toLowerCase().startsWith(query.toLowerCase());
        },
        itemSubmitted: (item) {
          widget.controller.text = item.toString();
        },
        suggestions: CryptoNames.cryptoShortNameList,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
        itemBuilder: (context, item) {
          return Container(
            color: const Color.fromARGB(255, 28, 36, 48),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  item.toString(),
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
