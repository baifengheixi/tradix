import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/app/routes/router.dart';

class MyApp extends StatelessWidget {
  final _appRouter = getIt<AppRouter>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) => MaterialApp.router(
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
