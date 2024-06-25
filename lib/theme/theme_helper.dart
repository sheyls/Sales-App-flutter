import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.deepPurple,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(
        secondary: Colors.amber,
        background: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black87),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
        titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
          textStyle: const TextStyle(fontSize: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}
