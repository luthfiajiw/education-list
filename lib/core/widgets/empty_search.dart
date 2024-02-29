import 'package:flutter/material.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 150,),
          Image.asset(
            "assets/images/Avatar.png",
            scale: 1.75,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 16
            ),
            child: Text(
              "Hasil Tidak Ditemukan",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Text(
            "Harap periksa kembali pencarian kamu.",
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}