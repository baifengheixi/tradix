import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/presentation/screens/home/views/home_view_desktop.dart';
import 'package:tradix/presentation/screens/home/views/home_view_mobile.dart';
import 'package:tradix/presentation/screens/home/views/home_view_tablet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        mode: OrientationLayoutBuilderMode.portrait,
        portrait: (context) => const HomeViewMobile(),
      ),
      tablet: (_) => const HomeViewTablet(),
      desktop: (_) => const HomeViewDesktop(),
    );
  }
}
