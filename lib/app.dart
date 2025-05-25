import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/main_layout.dart';
import 'package:couplefy/theme/app_theme_dark.dart';
import 'package:couplefy/theme/app_theme_light.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';

class MyApp extends StatefulWidget {
  /// Creates an instance of [MyApp].
  const MyApp({super.key});

  static Locale? language;

  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    MyApp.language = Locale(SharedPreferencesUtils.selectedValue ?? "en");
  }

  @override
  Widget build(BuildContext context) {
    // Choose theme of the app
    return ValueListenableBuilder<bool>(
      valueListenable: SharedPreferencesUtils.darkMode,
      builder: (context, darkMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: MyApp.language,
          // Supported languages
          supportedLocales: const [
            Locale('en'),
            Locale('cs'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: appThemeLight,
          darkTheme: appThemeDark,
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          title: 'Couplefy',
          home: MainLayout(),
        );
      },
    );
  }
}
