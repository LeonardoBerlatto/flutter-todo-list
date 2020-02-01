import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.blue[700],
    accentColor: Colors.blueAccent,
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(
          color: Colors.blue[700], fontSize: 20, fontWeight: FontWeight.bold),
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.blueGrey[800],
      ),
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.blue),
    iconTheme: IconThemeData(color: Colors.blue[700]),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500),
    ),
  );
}
