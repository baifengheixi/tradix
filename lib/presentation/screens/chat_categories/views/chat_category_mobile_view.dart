import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/commons/global_variable.dart';
import 'package:tradix/app/routes/router.gr.dart';
import 'package:tradix/business_logic/blocs/app_config/app_config_bloc.dart';
import 'package:tradix/business_logic/cubit/chat_history/chat_history_cubit.dart';
import 'package:tradix/business_logic/cubit/user_message/user_message_cubit.dart';
import 'package:tradix/presentation/screens/chat_categories/widgets/category_slider.dart';

class ChatCategoryMobileView extends StatelessWidget {
  const ChatCategoryMobileView({super.key});

  buildHistory(BuildContext context) {
    return Text(
      "History",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  buildCategoryList(BuildContext context) {
    return Text(
      "Categories",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  List<Widget> buildCategories(BuildContext context) {
    List<Widget> categories = [];

    for (var title in chatCategories.keys) {
      categories.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.screenHeight),
            Padding(
              padding: EdgeInsets.only(left: 5.screenWidth),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: (2.5).screenWidth),
              child: CategorySlider(titleData: chatCategories[title]!),
            ),
          ],
        ),
      );
    }

    return categories;
  }

  @override
  Widget build(BuildContext context) {
    var userMessageCubit = BlocProvider.of<UserMessageCubit>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // buildHistory(context),
          // buildCategoryList(context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.screenWidth),
            child: Text(
              "AI Chat",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.screenWidth, vertical: 5.screenWidth),
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
          ),
          Text(HydratedBloc.storage.read('$AppConfigBloc').toString()),
          BlocBuilder<ChatHistoryCubit, ChatHistoryState>(
            builder: (context, state) {
              return Text(HydratedBloc.storage.read('$ChatHistoryCubit').toString());
            },
          ),
          ...buildCategories(context),
        ],
      ),
    );
  }
}
