import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppGradients {
  // Static constants for gradients
  static LinearGradient customLinearGradient = const LinearGradient(
    begin: Alignment.topCenter, // Start at the top of the container
    end: Alignment.bottomCenter, // End at the bottom of the container
    colors: [
      Color.fromARGB(255, 128, 136, 240),
      Color.fromARGB(255, 128, 136, 243),
      Color.fromARGB(255, 156, 162, 245),
      Color.fromARGB(255, 233, 193, 232),
      Color.fromARGB(255, 204, 157, 228)
    ], // Define your gradient colors
  );

  // static RadialGradient customRadialGradient = const RadialGradient(
  //   colors: [Colors.orange, Colors.red],
  //   center: Alignment.center,
  //   radius: 0.8,
  // );
}

class MeditateColors {
  static const lightFillColor = Colors.black;
  static const darkFillColor = Colors.white;

  static final Color lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color darkFocusColor = Colors.white.withOpacity(0.12);

  static Color shadowColor(ColorScheme colorScheme) =>
      colorScheme.shadow.withOpacity(0.4);

  static Color scaffoldBackgroundColor(bool isLightTheme) =>
      isLightTheme ? Colors.white : const Color(0xFF202020);

  static Color canvasColor(bool isLightTheme) =>
      isLightTheme ? Colors.white : const Color(0xFF202020);

  static Color highlightColor(bool isLightTheme) =>
      isLightTheme ? Colors.white : Colors.transparent;

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    // Primary
    primary: Color(0xFFF07F74),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xD57148EE),
    onPrimaryContainer: Color(0xFFFFFFFF),
    // Secondary
    secondary: Color.fromARGB(255, 53, 52, 52),
    onSecondary: Color(0xFFF4F4F4),
    secondaryContainer: Color(0xFF539CFC),
    onSecondaryContainer: Color(0xFF343434),
    // Tertiary
    tertiary: Color(0xFFB35297),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFF296D8),
    onTertiaryContainer: Color(0xFF232323),
    // Error
    error: Color(0xFFFF0D00),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFF5C50),
    onErrorContainer: Color(0xFF0B0B0B),
    // Other
    outline: Color(0xFFE4E4E4),
    outlineVariant: Color(0xFF505050),
    background: Color(0xFFE0E0E0),
    onBackground: Color(0xFF262626),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF2E2E2E),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFFD0BCFF),
    shadow: Color(0xFF222222),
    surfaceTint: Color(0xFFB1D3FF),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Primary
    primary: Color(0xFFD0BCFF),
    onPrimary: Color(0xFF381E72),
    primaryContainer: Color(0xFF4F378B),
    onPrimaryContainer: Color(0xFFEADDFF),
    // Secondary
    secondary: Color(0xFFCCC2DC),
    onSecondary: Color(0xFF332D41),
    secondaryContainer: Color(0xFF4A4458),
    onSecondaryContainer: Color(0xFFE8DEF8),
    // Tertiary
    tertiary: Color(0xFFEFB8C8),
    onTertiary: Color(0xFF492532),
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD8E4),
    // Error
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFF9DEDC),
    // Other
    outline: Color(0xFF938F99),
    background: Color(0xFF1C1B1F),
    onBackground: Color(0xFFE6E1E5),
    surface: Color(0xFF1C1B1F),
    onSurface: Color(0xFFE6E1E5),
    surfaceVariant: Color(0xFF49454F),
    onSurfaceVariant: Color(0xFFCAC4D0),
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF6750A4),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFD0BCFF),
  );
}

enum ThemeModeVariant { light, dark }

class MeditateThemeData {
  static ThemeData lightThemeData = themeData(
    MeditateColors.lightColorScheme,
    MeditateColors.lightFocusColor,
    ThemeModeVariant.light,
  );
  static ThemeData darkThemeData = themeData(
    MeditateColors.darkColorScheme,
    MeditateColors.darkFocusColor,
    ThemeModeVariant.dark,
  );

  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
    ThemeModeVariant themeModeVariant,
  ) {
    final isLightTheme = themeModeVariant == ThemeModeVariant.light;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: MeditateFontTheme.textTheme,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: colorScheme.onPrimary, // Set the icon color here
        ),
      ),
    );
  }
}

extension ThemeExtention on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension TextThemeExtention on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ColorSchemeExtention on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

class MeditateFontTheme {
  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final _generalFontFamily = GoogleFonts.roboto();
  static final _headingsFontFamily = GoogleFonts.roboto();

  static final TextTheme textTheme = TextTheme(
    headlineLarge:
        _headingsFontFamily.copyWith(fontWeight: _semiBold, fontSize: 18.0),
    headlineMedium:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 14.0),
    headlineSmall:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 12.0),
    bodyLarge:
        _generalFontFamily.copyWith(fontWeight: _regular, fontSize: 14.0),
    bodyMedium:
        _generalFontFamily.copyWith(fontWeight: _regular, fontSize: 12.0),
    bodySmall: _generalFontFamily.copyWith(fontWeight: _light, fontSize: 10.0),
    displayLarge:
        _headingsFontFamily.copyWith(fontWeight: _bold, fontSize: 22.0),
    displayMedium:
        _headingsFontFamily.copyWith(fontWeight: _semiBold, fontSize: 18.0),
    displaySmall:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 14.0),
    titleLarge:
        _generalFontFamily.copyWith(fontWeight: _medium, fontSize: 17.0),
    titleMedium:
        _generalFontFamily.copyWith(fontWeight: _medium, fontSize: 14.0),
    titleSmall:
        _headingsFontFamily.copyWith(fontWeight: _medium, fontSize: 12.0),
    labelLarge:
        _generalFontFamily.copyWith(fontWeight: _medium, fontSize: 14.0),
    labelMedium:
        _generalFontFamily.copyWith(fontWeight: _semiBold, fontSize: 10.0),
    labelSmall:
        _generalFontFamily.copyWith(fontWeight: _regular, fontSize: 8.0),
  );
}
