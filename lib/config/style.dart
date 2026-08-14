import 'package:flutter/material.dart';

// app theme + colors
class Style {
  const Style();

  static const Radius radiusLg = Radius.circular(24);
  static const Radius radiusMd = Radius.circular(12);
  static const Radius radiusSm = Radius.circular(8);

  static final ThemeData lightTheme =
      ThemeData.light(useMaterial3: true).copyWith(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7c3aed), // violet-600
      dynamicSchemeVariant: DynamicSchemeVariant.rainbow,
      onPrimary: Colors.white,
      secondary: const Color(0xFF7c3aed), // violet-600
      onSecondary: Colors.white,
      tertiary: const Color(0xFFdb2777), // pink-600
      onTertiary: Colors.white,
      error: const Color(0xFFdc2626), // red-600
      surface: const Color(0xFFF1F5F9), // slate-100
      surfaceContainer: Colors.white,
      onSurface: const Color(0xFF030712), // gray-950
      onSurfaceVariant: const Color(0xFF111827), // gray-900
    ),
    dividerColor: const Color(0xFFcbd5e1), // slate-300
    shadowColor: Colors.black.withOpacity(.1),
    textTheme: ThemeData.light(useMaterial3: true).textTheme.apply(
          fontFamily: 'Nunito',
          displayColor: const Color(0xFF030712), // gray-950
          bodyColor: const Color(0xFF111827), // gray-900
        ),
    primaryTextTheme: ThemeData.light(useMaterial3: true).textTheme.apply(
          fontFamily: 'Nunito',
          displayColor: Colors.white,
          bodyColor: const Color(0xFFf9fafb), // gray-50
        ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 2,
    ),
  );

  static final ThemeData darkTheme =
      ThemeData.dark(useMaterial3: true).copyWith(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFFc4b5fd), // violet-400
      primary: const Color(0xFFc4b5fd), // violet-400
      onPrimary: Colors.black,
      secondary: const Color(0xFFa78bfa),
      onSecondary: Colors.white,
      tertiary: const Color(0xFFf472b6), // pink-400
      onTertiary: Colors.white,
      error: const Color(0xFFef4444), // red-500
      surface: Colors.black,
      surfaceContainer: const Color(0xFF18181b), // zinc-900
      onSurface: const Color(0xFFf9fafb), // gray-50
      onSurfaceVariant: const Color(0xFFf3f4f6), // gray-100
    ),
    dividerColor: const Color(0xFF52525b), // zinc-600
    shadowColor: Colors.white.withOpacity(.1),
    textTheme: ThemeData.dark(useMaterial3: true).textTheme.apply(
          fontFamily: 'Nunito',
          displayColor: const Color(0xFFf9fafb), // gray-50
          bodyColor: const Color(0xFFf3f4f6), // gray-100
        ),
    primaryTextTheme: ThemeData.dark(useMaterial3: true).textTheme.apply(
          fontFamily: 'Nunito',
          displayColor: const Color(0xFF030712), // gray-950
          bodyColor: const Color(0xFF111827), // gray-900
        ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF27272a), // zinc-800,
      elevation: 2,
    ),
  );
}
