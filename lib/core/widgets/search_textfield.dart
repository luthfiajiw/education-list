import 'dart:async';

import 'package:flutter/material.dart';

class SearchTextfield extends StatefulWidget {
  final AnimationController animationController;
  final TextEditingController? controller;
  final Function(String value)? onChanged;

  const SearchTextfield({
    super.key,
    required this.animationController,
    this.controller,
    this.onChanged
  });

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  late Animation<double> _animation;
  late Tween<double> _sizeTween;
  Timer? _debounce;

  onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    
    if (widget.onChanged != null) {
      _debounce = Timer(const Duration(milliseconds: 500), () {
          widget.onChanged!(value);
      });
    }
  }

  @override
  void initState() {
    _animation = CurvedAnimation(
      parent: widget.animationController,
      curve: Curves.fastOutSlowIn
    );
    _sizeTween = Tween(begin: 1, end: 0);
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _sizeTween.animate(_animation),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 20, 20, widget.controller != null && widget.controller?.text != "" ? 14 : 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(
                decoration: TextDecoration.none
              ),
              controller: widget.controller,
              onChanged: onSearchChanged,
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
            Visibility(
              visible: widget.controller != null && widget.controller?.text != "",
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Text(
                    "Hasil Pencarian \"${widget.controller?.text}\"",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}