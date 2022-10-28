import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.deepOrangeAccent;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.indigo,
      appBarTheme: const AppBarTheme(
        color: primaryColor,
        elevation: 0,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      )),
      //floating action buttons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor, elevation: 5),

      //elevated buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        elevation: 100,
        shape: const StadiumBorder(),
      )),
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primaryColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          )));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.indigo,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}
