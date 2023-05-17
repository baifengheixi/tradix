import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradix/app/commons/dark_theme.dart';
import 'package:tradix/app/commons/light_theme.dart';
import 'package:tradix/app/commons/share_preference.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/app/routes/router.dart';

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = getIt<AppRouter>();
  final SharedPreferences _prefs = getIt<SharedPreferences>();

  MyApp({super.key});

  ThemeMode getThemeMode() {
    if (_prefs.getString(SharePrefs.theme.toString()) == null) {
      return ThemeMode.system;
    }
    if (_prefs.getString(SharePrefs.theme.toString()) == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    // return const TestWidget();
    return ResponsiveApp(
      builder: (context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: getThemeMode(),
        theme: LightTheme.getTheme(),
        darkTheme: DarkTheme.getTheme(),
        routerConfig: _appRouter.config(),
        // locale: Locale("en"),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
