import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/presentation/screens/chat_features/views/chat_feature_mobile_view.dart';

@RoutePage()
class ChatFeatureView extends StatelessWidget {
  const ChatFeatureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        mode: OrientationLayoutBuilderMode.portrait,
        portrait: (context) => const ChatFeatureMobileView(),
      ),
    );
  }
}
