import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/routes/router.gr.dart';
import 'package:tradix/business_logic/cubit/system_message/system_message_cubit.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/category.dart';

class CategorySlider extends StatelessWidget {
  final Map<String, String> titleData;

  const CategorySlider({
    required this.titleData,
    super.key,
  });

  List<Widget> buildItems(BuildContext context) {
    var systemMessageCubit = BlocProvider.of<SystemMessageCubit>(context);

    List<Widget> items = [];

    for (var subTitle in titleData.keys) {
      items.add(
        Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                systemMessageCubit.update(titleData[subTitle]!);
                AutoRouter.of(context).pushNamed(ChatRoute.name.path);
                // showDialog(
                //   context: context,
                //   builder: (_) {
                //     return AlertPrompt(
                //       title: subTitle,
                //       prompt: titleData[subTitle]!,
                //     );
                //   },
                // );
              },
              child: Category(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                backgroundGradient: const LinearGradient(
                  colors: [
                    Colors.black45,
                    Colors.black38,
                    Colors.black26,
                    Colors.black12,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 0.2, 0.5, 0.8],
                ),
                child: AutoSizeText(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  maxLines: 2,
                ),
              ),
            );
          },
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 15.screenHeight,
        viewportFraction: 0.6,
        enableInfiniteScroll: false,
        padEnds: false,
      ),
      items: buildItems(context),
    );
  }
}
