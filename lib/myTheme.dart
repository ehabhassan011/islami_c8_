import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightColor = Color(0xFFB7935F);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightColor,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColor,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
      ));

  static ThemeData darkTheme = ThemeData();
}
