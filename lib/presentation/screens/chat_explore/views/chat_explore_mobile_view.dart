import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/commons/global_variable.dart';
import 'package:tradix/app/routes/router.gr.dart';
import 'package:tradix/business_logic/cubit/system_message/system_message_cubit.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/feature.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/history_slider.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/sub_title_text.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/title_text.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/user_text_input.dart';

var myList = chatCategories.values.toList();

class ChatExploreMobileView extends StatelessWidget {
  const ChatExploreMobileView({super.key});

  buildFeatures() {
    final featureData = chatCategories['Trickle Featured'];

    return ListView.builder(
      itemCount: featureData!.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final systemMessageCubit = BlocProvider.of<SystemMessageCubit>(context);

        return GestureDetector(
          onTap: () {
            systemMessageCubit.update(featureData.values.toList()[index]);
            AutoRouter.of(context).pushNamed(ChatRoute.name.path);
          },
          child: Feature(
            title: featureData.keys.toList()[index],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(),
          const UserTextInput(),
          SubTitleText(
            subTitle: "History",
            isShowMore: true,
            onTapShowMore: () {
              AutoRouter.of(context).pushNamed(ChatHistoryRoute.name.path);
            },
          ),
          const HistorySlider(),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 4),
            child: SubTitleText(
              subTitle: "Feature",
              isShowMore: true,
              onTapShowMore: () {
                AutoRouter.of(context).pushNamed(ChatFeatureRoute.name.path);
              },
            ),
          ),
          buildFeatures(),
        ],
      ),
    );
  }
}
