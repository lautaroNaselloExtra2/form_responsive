import 'package:flutter/material.dart';

class AppStyles {
  // Text Styles
  static const heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0.5,
  );

  static const heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );

  static const bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static const inputText = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static const errorText = TextStyle(
    fontSize: 14,
    color: Colors.red,
    fontWeight: FontWeight.w500,
  );

  // Estilo para el botón cuando está activo
  static ButtonStyle activeButtonStyle = ButtonStyle(
    backgroundColor:
        const WidgetStatePropertyAll<Color>(Colors.blue), // Color de fondo
    foregroundColor:
        const WidgetStatePropertyAll<Color>(Colors.white), // Color del texto
    padding: const WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0)), // Espaciado
    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12))), // Borde redondeado
    elevation: const WidgetStatePropertyAll(5), // Sombra para el botón
  );

  // Estilo para el botón cuando está deshabilitado
  static ButtonStyle disabledButtonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll<Color>(
        Colors.grey.withOpacity(0.6)), // Fondo gris con opacidad
    foregroundColor:
        const WidgetStatePropertyAll<Color>(Colors.white), // Color del texto
    padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(
        vertical: 16.0, horizontal: 32.0)), // Mismo espaciado que el activo
    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12))), // Mismo borde
    elevation: const WidgetStatePropertyAll(
        0), // Sin sombra en el estado deshabilitado
  );
  // Input Decorations (Material Style)
  static InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    );
  }

  // Shadows and Elevations
  static const boxShadow = BoxShadow(
    color: Colors.grey,
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  // Other Styles
  static const drawerWidth = 280.0; // Similar a iOS drawer size for web
}
