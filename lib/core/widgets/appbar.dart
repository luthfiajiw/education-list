import 'package:flutter/material.dart';

AppBar appbar(BuildContext context, {
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
        style: Theme.of(context).textTheme.titleLarge
      ),
    ),
    actions: actions,
    bottom: bottom,
  );
}