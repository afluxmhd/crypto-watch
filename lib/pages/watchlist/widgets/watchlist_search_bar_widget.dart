import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:crypto_watch/data/crypto/crypto_names.dart';
import 'package:flutter/material.dart';

class WatchlistSearchBarWidget extends StatefulWidget {
  const WatchlistSearchBarWidget({super.key, required this.controller, required this.hintText, required this.onPressed});

  final TextEditingController controller;
  final String hintText;
  final void Function() onPressed;

  @override
  State<WatchlistSearchBarWidget> createState() => _WatchlistSearchBarWidgetState();
}

class _WatchlistSearchBarWidgetState extends State<WatchlistSearchBarWidget> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 3, right: 3, bottom: 25),
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
            suffixIcon: IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(Icons.search),
            )),
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
