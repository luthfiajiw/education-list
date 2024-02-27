import 'package:flutter/material.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.search_rounded,
              color: Colors.blue.shade700,
            ),
          ),
          hintText: "Ketikkan topik yang kamu mau cari"
        ),
      ),
    );
  }
}