import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/business_logic/blocs/coins/coins_bloc.dart';
import 'package:tradix/presentation/screens/home/views/home_view_desktop.dart';
import 'package:tradix/presentation/screens/home/views/home_view_mobile.dart';
import 'package:tradix/presentation/screens/home/views/home_view_tablet.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CoinsBloc>(),
      child: ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(
          mode: OrientationLayoutBuilderMode.portrait,
          portrait: (context) => const HomeViewMobile(),
        ),
        tablet: (_) => const HomeViewTablet(),
        desktop: (_) => const HomeViewDesktop(),
      ),
    );
  }
}
