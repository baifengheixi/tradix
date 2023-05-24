import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/routes/router.gr.dart';
import 'package:tradix/business_logic/cubit/user_message/user_message_cubit.dart';

class UserTextInput extends StatelessWidget {
  const UserTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    final userMessageCubit = BlocProvider.of<UserMessageCubit>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.purple.shade300,
          width: 2,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Flexible(
            child: BlocBuilder<UserMessageCubit, UserMessageState>(
              buildWhen: (_, state) {
                return state.isSubmitted;
              },
              builder: (context, state) {
                return TextField(
                  cursorWidth: 0,
                  controller: TextEditingController(text: state.message),
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a message',
                  ),
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    userMessageCubit.update(value);
                  },
                );
              },
            ),
          ),
          SizedBox(width: 2.screenWidth),
          IconButton(
            color: Colors.purple,
            icon: const Icon(Icons.send),
            onPressed: () {
              if (userMessageCubit.state.message.isEmpty) {
                return;
              }
              AutoRouter.of(context).pushNamed(ChatRoute.name.path);
            },
          ),
        ],
      ),
    );
  }
}
