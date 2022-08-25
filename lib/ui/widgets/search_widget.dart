import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: const Icon(Icons.search,color: Color(0xff167B77)),
        hintText: "Ingresa el producto a buscar...",
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: Color(0xffF19F2F),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2.0,
            color: Color(0xff167B77),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
