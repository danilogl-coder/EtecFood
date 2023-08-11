import 'package:flutter/material.dart';

class CustomTextFieldBorder extends StatelessWidget {
  const CustomTextFieldBorder({super.key, required this.label, required this.color,});

  final String label;
  final TextStyle color;

  TextStyle colors()
  {
    return TextStyle(color: color);
  }

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                    decoration: InputDecoration(
                        labelText: label,
                        labelStyle: color,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide: const BorderSide(color: Colors.black))),
                    keyboardType: TextInputType.emailAddress,
                  );
  }
}