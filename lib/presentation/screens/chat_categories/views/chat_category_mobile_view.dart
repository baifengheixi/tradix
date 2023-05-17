import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/commons/global_variable.dart';
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
    List<Widget> categories = [
      Text(
        "Chat",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ];

    for (var key in chatCategories.keys) {
      categories.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.screenHeight),
            Padding(
              padding: EdgeInsets.only(left: 5.screenWidth),
              child: Text(
                key,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: (2.5).screenWidth),
              child: CategorySlider(texts: chatCategories[key]!),
            ),
          ],
        ),
      );
    }

    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // buildHistory(context),
          // buildCategoryList(context),
          ...buildCategories(context),
        ],
      ),
    );
  }
}
