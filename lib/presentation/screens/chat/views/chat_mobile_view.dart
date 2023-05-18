import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/business_logic/blocs/chat_openai/chat_openai_bloc.dart';

class ChatMobileView extends StatelessWidget {
  const ChatMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<ChatOpenAIBloc>().add(ChatOpenAIFetchEvent());
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ChatOpenAIBloc, ChatOpenAIState>(
        builder: (context, state) {
          return Center(
            child: Text(context.read<ChatOpenAIBloc>().state.message ?? "no data"),
          );
        },
      ),
      bottomSheet: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(2.screenWidth),
        height: 10.screenHeight,
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            SizedBox(width: 2.screenWidth),
            const Icon(Icons.send),
          ],
        ),
      ),
    );
  }
}
