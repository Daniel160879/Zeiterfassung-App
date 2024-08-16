/*import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final String? _fontFamily = GoogleFonts.figtree().fontFamily;

  static final TextStyle w100 =
      GoogleFonts.figtree(fontWeight: FontWeight.w100);
  static final TextStyle w200 =
      GoogleFonts.figtree(fontWeight: FontWeight.w200);
  static final TextStyle w300 =
      GoogleFonts.figtree(fontWeight: FontWeight.w300);
  static final TextStyle w400 =
      GoogleFonts.figtree(fontWeight: FontWeight.w400);
  static final TextStyle w500 =
      GoogleFonts.figtree(fontWeight: FontWeight.w500);
  static final TextStyle w600 =
      GoogleFonts.figtree(fontWeight: FontWeight.w600);
  static final TextStyle w700 =
      GoogleFonts.figtree(fontWeight: FontWeight.w700);
  static final TextStyle w800 =
      GoogleFonts.figtree(fontWeight: FontWeight.w800);
  static final TextStyle w900 =
      GoogleFonts.figtree(fontWeight: FontWeight.w900);

  static final TextTheme _baseTextTheme = TextTheme(
    displayLarge: w100.copyWith(fontSize: 40, letterSpacing: 0, height: 1.12),
    displayMedium: w200.copyWith(fontSize: 40, letterSpacing: 0, height: 1.12),
    displaySmall: w300.copyWith(fontSize: 40, letterSpacing: 0, height: 1.12),

    headlineLarge: w400.copyWith(fontSize: 25, letterSpacing: 0, height: 1.2),
    headlineMedium: w500.copyWith(fontSize: 25, letterSpacing: 0, height: 1.2),
    headlineSmall: w600.copyWith(fontSize: 25, letterSpacing: 0, height: 1.2),

    titleLarge: w700.copyWith(fontSize: 18, letterSpacing: 0, height: 1.4),
    titleMedium: w800.copyWith(fontSize: 18, letterSpacing: 0, height: 1.4),
    titleSmall: w900.copyWith(fontSize: 18, letterSpacing: 0, height: 1.4),

    bodyLarge: w300.copyWith(fontSize: 16, letterSpacing: 0, height: 1.4),
    bodyMedium: w400.copyWith(fontSize: 16, letterSpacing: 0, height: 1.4),
    bodySmall: w500.copyWith(fontSize: 16, letterSpacing: 0, height: 1.4),

    labelLarge: w800.copyWith(fontSize: 12, letterSpacing: 0, height: 1.4),
    labelMedium: w600.copyWith(fontSize: 12, letterSpacing: 0, height: 1.4),
    labelSmall: w300.copyWith(fontSize: 12, letterSpacing: 0, height: 1.4),

    // headlineLarge: TextStyle(
    //   fontSize: 40,
    //   fontWeight: FontWeight.w900,
    //   fontFamily: _fontFamily,
    // ),
    // titleMedium: TextStyle(
    //   fontSize: 16,
    //   fontWeight: FontWeight.bold,
    //   fontFamily: _fontFamily,
    // ),
  );

  static final TextTheme _lightTextTheme = _baseTextTheme.copyWith(
    headlineLarge: _baseTextTheme.headlineLarge?.copyWith(color: Colors.black),
  );

  static final TextTheme _darkTextTheme = _baseTextTheme.copyWith(
    headlineLarge: _baseTextTheme.headlineLarge?.copyWith(color: Colors.white),
  );

  static ThemeData get lightTheme => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xffff9500),
          primaryContainer: Color(0xffffcc80),
          secondary: Color(0xff2979ff),
          secondaryContainer: Color(0xffe4eaff),
          tertiary: Color(0xff0028C3),
          tertiaryContainer: Color(0xffcbd6ff),
          appBarColor: Color(0xffe4eaff),
          error: Color(0xffb00020),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          textButtonSchemeColor: SchemeColor.onPrimaryContainer,
          filledButtonRadius: 8.0,
          outlinedButtonRadius: 8.0,
          elevatedButtonRadius: 8.0,
          inputDecoratorIsFilled: false,
          inputDecoratorBorderSchemeColor: SchemeColor.onPrimary,
          inputDecoratorRadius: 8.0,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          cardElevation: 4.0,
          toggleButtonsBorderWidth: 0,
          toggleButtonsSchemeColor: SchemeColor.onSecondaryContainer,
          toggleButtonsRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: _fontFamily,
        textTheme: _lightTextTheme,
        scaffoldBackground: Color(0xFFF2F6FA),
        onPrimary: Colors.white,
      );

  static ThemeData get darkTheme => FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xffff9500),
          primaryContainer: Color(0xffc87200),
          secondary: Color(0xff82b1ff),
          secondaryContainer: Color(0xff3770cf),
          tertiary: Color(0xff0028C3),
          tertiaryContainer: Color(0xff0b429c),
          appBarColor: Color(0xff3770cf),
          error: Color(0xffcf6679),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          textButtonSchemeColor: SchemeColor.onPrimaryContainer,
          filledButtonRadius: 8.0,
          outlinedButtonRadius: 8.0,
          elevatedButtonRadius: 8.0,
          inputDecoratorIsFilled: false,
          inputDecoratorRadius: 8.0,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
          cardElevation: 4.0,
          toggleButtonsSchemeColor: SchemeColor.onSecondaryContainer,
          toggleButtonsRadius: 8.0,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: _fontFamily,
        textTheme: _darkTextTheme,
        onPrimary: Colors.white,
      );
}*/
