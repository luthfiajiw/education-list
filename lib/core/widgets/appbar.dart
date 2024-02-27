import 'package:flutter/material.dart';

AppBar appbar({
  required String title,
  List<Widget>? actions,
  PreferredSizeWidget? bottom
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leadingWidth: 0,
    title: Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700
        )
      ),
    ),
    actions: actions,
    bottom: bottom,
  );
}