import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paksimapp/core/theme/theme_constants.dart';

final ThemeData lightAppTheme = ThemeData(
  brightness: Brightness.light,

  colorScheme: ColorScheme.fromSeed(
    seedColor: kAccentColor,
    brightness: Brightness.light,
    primary: kAccentColor,
    secondary: kSecondaryAccentColor,
    surface: kLightBackgroundColor,
    background: kLightBackgroundColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: kDarkTextColor,
    onBackground: kDarkTextColor,
    error: Colors.red,
    onError: Colors.white,
  ),

  primarySwatch: Colors.teal, // Optional legacy compatibility

  scaffoldBackgroundColor: kLightBackgroundColor,
  dialogBackgroundColor: kLightBackgroundColor,

  textTheme: const TextTheme(
    displaySmall: TextStyle(fontFamily: Bold, fontSize: 20.0, color: kDarkTextColor),
    headlineMedium: TextStyle(fontFamily: Bold, fontSize: 18.0, color: kDarkTextColor),
    headlineSmall: TextStyle(fontFamily: Bold, fontSize: 16.0, color: kDarkTextColor),
    titleLarge: TextStyle(fontFamily: Bold, fontSize: 14.0, color: kDarkTextColor),
    bodyLarge: TextStyle(fontFamily: Regular, fontSize: 12.0, color: kDarkTextColor),
    bodyMedium: TextStyle(fontFamily: Regular, fontSize: 10.0, color: kDarkTextColor),
  ),

  iconTheme: IconThemeData(color: Colors.grey.shade600),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: kDarkTextColor,
    systemOverlayStyle: SystemUiOverlayStyle.dark, // <-- important: makes time & battery dark
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: kAccentColor,
    unselectedItemColor: Colors.grey.shade600,
    backgroundColor: kLightBackgroundColor,
    type: BottomNavigationBarType.fixed,
  ),

  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: kDarkTextColor.withOpacity(0.5)),
    labelStyle: const TextStyle(color: kDarkTextColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.black.withOpacity(0.04),
    prefixIconColor: kAccentColor,
  ),
);
