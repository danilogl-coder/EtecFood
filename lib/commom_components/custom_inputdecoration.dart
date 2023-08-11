import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration setCustomInputDecoration(
      {required String label, required Color customColor}) {
    return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: customColor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(
              color: customColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(color: customColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: BorderSide(color: customColor)));
  }
}
