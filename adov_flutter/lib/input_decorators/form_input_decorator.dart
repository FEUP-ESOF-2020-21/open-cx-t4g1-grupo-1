import 'package:flutter/material.dart';

class CustomInputDecorator extends InputDecoration {
  static InputDecoration decorator() {
    return InputDecoration(
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      labelText: "Talk Date",
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      errorStyle: TextStyle(height: 0),
    );
  }
}