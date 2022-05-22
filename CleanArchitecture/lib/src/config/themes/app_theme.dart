import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    final ThemeData theme = ThemeData();
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      colorScheme: theme.colorScheme.copyWith(secondary: Colors.black),
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
    );
  }
}