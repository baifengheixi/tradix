import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/business_logic/blocs/app_config/app_config_bloc.dart';
import 'package:tradix/presentation/screens/on_boarding/views/on_boarding_view_mobile.dart';

@RoutePage()
class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AppConfigBloc>().add(AppConfigUpdateEvent());

    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        mode: OrientationLayoutBuilderMode.portrait,
        portrait: (context) => const OnBoardingMobileView(),
      ),
    );
  }
}
