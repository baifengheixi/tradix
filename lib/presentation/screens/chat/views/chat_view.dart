import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/presentation/screens/chat/bloc/ai_message/ai_message_bloc.dart';
import 'package:tradix/presentation/screens/chat/views/chat_mobile_view.dart';

@RoutePage()
class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AIMessageBloc>(
          create: (BuildContext context) => getIt<AIMessageBloc>(),
        ),
      ],
      child: ScreenTypeLayout.builder(
        mobile: (_) => OrientationLayoutBuilder(
          mode: OrientationLayoutBuilderMode.portrait,
          portrait: (context) => const ChatMobileView(),
        ),
      ),
    );
  }
}
