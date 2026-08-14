import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:jabu_mobile/config/style.dart';
import 'package:jabu_mobile/cubit/theme_cubit.dart';
import 'package:jabu_mobile/ui/screens/home_screen.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // smoother scrolling on android
  if (!kIsWeb && Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  // for saving the theme
  final tmpDir = await getTemporaryDirectory();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: tmpDir);

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en')],
      fallbackLocale: const Locale('en'),
      useFallbackTranslations: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Jabu',
            theme: Style.lightTheme,
            darkTheme: Style.darkTheme,
            themeMode: state.themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
