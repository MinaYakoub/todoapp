import 'package:flutter/material.dart';

class MyTheme {
  static Color primarylight = Color(0xff5D9CEC);
  static Color blackColor = Colors.black;
  static Color primaryDark = Color(0xff5D9CEC);
  static Color lightGreen = Color(0xff61E757);
  static Color backgroundLight = Color(0xffDFECDB);
  static Color backgroundDark = Color(0xff060E1E);
  static Color backgroundTaskColor = Color(0xff141922);
  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
          titleSmall: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255))),
      primaryColor: primarylight,
      scaffoldBackgroundColor: Color.fromARGB(255, 198, 220, 192),
      appBarTheme: AppBarTheme(color: primarylight),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: false,
          unselectedItemColor: blackColor,
          selectedItemColor: primarylight));
  static ThemeData darkThme = ThemeData(
      textTheme: TextTheme(
          titleSmall: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255))),
      primaryColor: primaryDark,
      scaffoldBackgroundColor:backgroundDark,
      appBarTheme: AppBarTheme(color: primarylight),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: false,
          unselectedItemColor: blackColor,
          selectedItemColor: primarylight));
}
