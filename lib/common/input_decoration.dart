import 'package:flutter/material.dart';

InputDecoration inputDecoration(
  String hintText,
) {
  return InputDecoration(
    hintText: hintText,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 2,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.brown,
        width: 2,
      ),
    ),
  );
}
