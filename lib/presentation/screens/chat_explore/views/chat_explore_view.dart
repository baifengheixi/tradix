import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/presentation/screens/chat_explore/views/chat_explore_mobile_view.dart';

@RoutePage()
class ChatExploreView extends StatelessWidget {
  const ChatExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        mode: OrientationLayoutBuilderMode.portrait,
        portrait: (context) => const ChatExploreMobileView(),
      ),
    );
  }
}
