import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/commons/dark_theme.dart';
import 'package:tradix/app/commons/light_theme.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/app/routes/router.dart';
import 'package:tradix/business_logic/blocs/app_config/app_config_bloc.dart';
import 'package:tradix/business_logic/cubit/chat_history/chat_history_cubit.dart';
import 'package:tradix/business_logic/cubit/history_message/history_message_cubit.dart';
import 'package:tradix/business_logic/cubit/system_message/system_message_cubit.dart';
import 'package:tradix/business_logic/cubit/user_message/user_message_cubit.dart';

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = getIt<AppRouter>();

  MyApp({super.key});

  ThemeMode getThemeMode() {
    // if (_prefs.getString(SharePrefs.theme.toString()) == null) {
    //   return ThemeMode.system;
    // }
    // if (_prefs.getString(SharePrefs.theme.toString()) == ThemeMode.dark.toString()) {
    //   return ThemeMode.dark;
    // }
    return ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppConfigBloc>(
          create: (BuildContext context) => AppConfigBloc(),
        ),
        BlocProvider<HistoryMessageCubit>(
          create: (BuildContext context) => HistoryMessageCubit(),
        ),
        BlocProvider<SystemMessageCubit>(
          create: (BuildContext context) => SystemMessageCubit(),
        ),
        BlocProvider<UserMessageCubit>(
          create: (BuildContext context) => UserMessageCubit(),
        ),
        BlocProvider<ChatHistoryCubit>(
          create: (BuildContext context) => ChatHistoryCubit(),
        ),
      ],
      child: ResponsiveApp(
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
      ),
    );
  }
}
