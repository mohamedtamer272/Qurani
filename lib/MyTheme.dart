import 'package:flutter/material.dart';

class MyThemedata {
  static Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);
  static Color primaryDarkColor = Color.fromRGBO(20, 27, 48, 1.0);
  static Color onprimaryDarkColor = Color.fromRGBO(241, 194, 37, 1.0);

  static ThemeData lightTheme = ThemeData(
      primaryColor: colorGold,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
        primary: colorGold,
        onPrimary: colorBlack,
        background: Colors.transparent,
        onBackground: colorBlack,
        error: Colors.red,
        onError: Colors.white,
        secondary: Colors.brown,
        onSecondary: Colors.white,
        surface: colorGold,
        onSurface: Colors.white,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: colorBlack, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 30, color: colorGold, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyThemedata.colorGold,
          selectedItemColor: colorBlack,
          unselectedItemColor: Colors.white),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),);

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
        primary: primaryDarkColor,
        onPrimary: onprimaryDarkColor,
        background: Colors.transparent,
        onBackground: onprimaryDarkColor,
        error: Colors.red,
        onError: Colors.white,
        secondary: primaryDarkColor,
        onSecondary: onprimaryDarkColor,
        surface: primaryDarkColor,
        onSurface: onprimaryDarkColor,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30,
              color: onprimaryDarkColor,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 30,
              color: onprimaryDarkColor,
              fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: primaryDarkColor,
          selectedItemColor: onprimaryDarkColor,
          unselectedItemColor: Colors.white),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: MyThemedata.primaryDarkColor,
      ));
}
