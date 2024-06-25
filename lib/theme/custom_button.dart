import 'package:flutter/material.dart';

class CustomButtons {
  static ElevatedButton customElevatedButton({
    required String text,
    required VoidCallback onPressed,
    Color backgroundColor = Colors.blue,
    Color textColor = Colors.white,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Usar backgroundColor para el color de fondo
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
    );
  }
}
