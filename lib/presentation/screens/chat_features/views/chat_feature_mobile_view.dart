import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/commons/global_variable.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/category_slider.dart';
import 'package:tradix/presentation/screens/chat_features/widgets/chat_feature_title.dart';

class ChatFeatureMobileView extends StatelessWidget {
  const ChatFeatureMobileView({super.key});

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        color: Colors.black,
        icon: const Icon(Icons.west),
        onPressed: () {
          AutoRouter.of(context).pop();
        },
      ),
      title: const Text(
        "Features",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Agne',
          fontSize: 25,
          letterSpacing: 1.2,
        ),
      ),
      centerTitle: true,
    );
  }

  List<Widget> buildCategories(BuildContext context) {
    List<Widget> categories = [];

    for (var title in chatCategories.keys) {
      categories.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.sailing, size: 30),
                  const SizedBox(width: 8),
                  ChatFeatureTitle(title: title),
                ],
              ),
            ),
            const SizedBox(height: 16),
            CategorySlider(titleData: chatCategories[title]!),
            const SizedBox(height: 16),
            SizedBox(
              width: 90.screenWidth,
              child: const Divider(
                color: Colors.deepPurple,
                thickness: 1.2,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    }

    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12),
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ...buildCategories(context),
          ],
        ),
      ),
    );
  }
}
