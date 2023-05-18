import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/business_logic/blocs/chat_openai/chat_openai_bloc.dart';
import 'package:tradix/presentation/screens/chat/views/chat_mobile_view.dart';

@RoutePage()
class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatOpenAIBloc>(),
      child: ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(
          mode: OrientationLayoutBuilderMode.portrait,
          portrait: (context) => const ChatMobileView(),
        ),
      ),
    );
  }
}
