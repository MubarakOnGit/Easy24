import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //app basic colors
  static const Color primary = Color(0xFF0662E6);
  static const Color secondary = Color(0xFFFAF740);
  static const Color accent = Color(0xFF40DEFA);

  //Gradient Colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xffff9a9e), Color(0xffedb4b5), Color(0xfff3d9d9)],
  );

  //text colors
  static const Color textPrimary = Color(0xFF32302F);
  static const Color textSecondary = Color(0xFF777777);
  static const Color textWhite = Colors.white;

  //background colors
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF22221F);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //background container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = AppColors.white.withValues(alpha: 0.1);

  //Button Colors
  static const Color buttonPrimary = Color(0xFF0662E6);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFF3F5FF);

  //Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  //Error and Validation Colors
  static const Color error = Color(0xFFF60724);
  static const Color success = Color(0xFF07E321);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF0662E6);

  //Neutral Shades
  static const Color black = Color(0xFF272626);
  static const Color darkerGrey = Color(0xFF3A3939);
  static const Color darkGrey = Color(0xFF979696);
  static const Color grey = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
}
