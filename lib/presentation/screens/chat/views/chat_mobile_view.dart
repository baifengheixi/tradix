import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradix/business_logic/blocs/chat_openai/chat_openai_bloc.dart';

class ChatMobileView extends StatelessWidget {
  const ChatMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ChatOpenAIBloc>().add(ChatOpenAIFetchEvent());
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ChatOpenAIBloc, ChatOpenAIState>(
        builder: (context, state) {
          return Center(
            child: Text(context.read<ChatOpenAIBloc>().state.openai?.choices.first.message.content ?? "no data"),
          );
        },
      ),
    );
  }
}
