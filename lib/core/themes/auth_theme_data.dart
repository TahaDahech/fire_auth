import 'package:flutter/material.dart';

class AuthThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.all(18),
        fillColor: Colors.white.withOpacity(0.9),
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(13)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            strokeAlign: 0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(13)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            strokeAlign: 0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(13)),
        ),
        // outlineBorder: BorderSide(
        //   color: Colors.green,
        // ),
        // suffixIconColor: Colors.green,
        hintStyle: const TextStyle(
          color: Colors.black54,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 1,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF006A65),
    primaryContainer: Color(0xFF98F2EA),
    secondary: Color(0xFF506260),
    secondaryContainer: Color(0xFFD3E7E4),
    background: Color(0xFFFCFCFB),
    surface: Color(0xFFFCFCFB),
    onBackground: Color(0xFF191C1C),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF191C1C),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFF7CD6CE),
    primaryContainer: Color(0xFF00504C),
    secondary: Color(0xFFB7CBC8),
    secondaryContainer: Color(0xFF384A48),
    background: Color(0xFF191C1C),
    surface: Color(0xFF191C1C),
    onBackground: Color(0xFFE2E3E1),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    onPrimary: Color(0xFF003734),
    onSecondary: Color(0xFF223432),
    onSurface: Color(0xFFE2E3E1),
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  // static const _bold = FontWeight.w700;

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(fontWeight: _regular, fontSize: 57.0),
    displayMedium: TextStyle(fontWeight: _regular, fontSize: 45.0),
    displaySmall: TextStyle(fontWeight: _regular, fontSize: 36.0),
    headlineLarge: TextStyle(fontWeight: _regular, fontSize: 32.0),
    headlineMedium: TextStyle(fontWeight: _regular, fontSize: 28.0),
    headlineSmall: TextStyle(fontWeight: _regular, fontSize: 24.0),
    titleLarge: TextStyle(fontWeight: _regular, fontSize: 22.0),
    titleMedium: TextStyle(fontWeight: _medium, fontSize: 16.0),
    titleSmall: TextStyle(fontWeight: _medium, fontSize: 14.0),
    labelLarge: TextStyle(fontWeight: _medium, fontSize: 14.0),
    labelMedium: TextStyle(fontWeight: _medium, fontSize: 12.0),
    labelSmall: TextStyle(fontWeight: _medium, fontSize: 11.0),
    bodyLarge: TextStyle(fontWeight: _regular, fontSize: 16.0),
    bodyMedium: TextStyle(fontWeight: _regular, fontSize: 14.0),
    bodySmall: TextStyle(fontWeight: _regular, fontSize: 12.0),
  );
}
