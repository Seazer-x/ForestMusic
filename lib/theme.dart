import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(
  _grennPrimary,
  <int, Color>{
    50: Color(0xFF85858A),
    100: Color(0xFF5AB68A),
    200: Color(0xFF28A268),
    300: Color(0xFF158650),
    400: Color(0xFF0C7744),
    500: Color(_grennPrimary),
    600: Color(0xFF046036),
    700: Color(0xFF0D5B3A),
    800: Color(0xFF0B5033),
    900: Color(0xFF09422B),
  },
);

const Color primaryTextColor = Color(0xFF046036);

const Color buttonColor = Color(0xffedfaed);

const Color secondaryTextColor = Color(0xFF7A869A);

const TextStyle primaryText = TextStyle(fontSize: 15, color: Color(0xFF046036));

const TextStyle secondaryText =
    TextStyle(fontSize: 12, color: Color(0xFF7A869A));

const int _grennPrimary = 0xFF006D3C;

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006D3C),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF97F7B6),
  onPrimaryContainer: Color(0xFF00210F),
  secondary: Color(0xFF4F6353),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD2E8D4),
  onSecondaryContainer: Color(0xFF0D1F13),
  tertiary: Color(0xFF3A646F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBEEAF7),
  onTertiaryContainer: Color(0xFF001F26),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFDF8),
  onBackground: Color(0xFF191C19),
  surface: Color(0xFFFBFDF8),
  onSurface: Color(0xFF191C19),
  surfaceVariant: Color(0xFFDCE5DB),
  onSurfaceVariant: Color(0xFF414942),
  outline: Color(0xFF717971),
  onInverseSurface: Color(0xFFF0F1EC),
  inverseSurface: Color(0xFF2E312E),
  inversePrimary: Color(0xFF7CDA9C),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006D3C),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF7CDA9C),
  onPrimary: Color(0xFF00391D),
  primaryContainer: Color(0xFF00522C),
  onPrimaryContainer: Color(0xFF97F7B6),
  secondary: Color(0xFFB6CCB9),
  onSecondary: Color(0xFF223527),
  secondaryContainer: Color(0xFF384B3D),
  onSecondaryContainer: Color(0xFF5D605D),
  tertiary: Color(0xFFA2CDDA),
  onTertiary: Color(0xFF023640),
  tertiaryContainer: Color(0xFF214C57),
  onTertiaryContainer: Color(0xFFBEEAF7),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C19),
  onBackground: Color(0xFFA7DA59),
  surface: Color(0xFF191C19),
  onSurface: Color(0xFFE1E3DE),
  surfaceVariant: Color(0xFF414942),
  onSurfaceVariant: Color(0xFFC0C9BF),
  outline: Color(0xFF8B938A),
  onInverseSurface: Color(0xFF191C19),
  inverseSurface: Color(0xFF5F605D),
  inversePrimary: Color(0xFF006D3C),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF7CDA9C),
);
