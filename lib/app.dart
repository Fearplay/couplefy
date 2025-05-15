import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:couplefy/l10n/app_localizations.dart';
import 'package:couplefy/main_layout.dart';
import 'package:couplefy/screens/home_screen.dart';
import 'package:couplefy/screens/love_screen.dart';
import 'package:couplefy/screens/navigation_screen.dart';
import 'package:couplefy/screens/quote_screen.dart';
import 'package:couplefy/screens/settings_screen.dart';
import 'package:couplefy/theme/app_theme_dark.dart';
import 'package:couplefy/theme/app_theme_light.dart';
import 'package:couplefy/utils/shared_preferences_utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static Locale? language;

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

      MyApp.language = Locale(SharedPreferencesUtils.selectedValue ?? "en");

  }


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: SharedPreferencesUtils.darkMode,
      builder: (context, darkMode, _){
return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: MyApp.language,
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
        themeMode:darkMode ?
            ThemeMode.dark :
            ThemeMode.light,
        title: 'Couplefy',
        home: MainLayout(),
      );
      },
    );
  }
}
