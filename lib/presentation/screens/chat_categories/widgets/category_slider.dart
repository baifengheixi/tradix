import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/presentation/screens/chat_categories/widgets/alert_prompt.dart';

class CategorySlider extends StatelessWidget {
  final Map<String, String> titleData;
  final int width = 40;
  final int maxLine = 2;

  const CategorySlider({
    required this.titleData,
    super.key,
  });

  randomColor() {
    Color randomColor;
    do {
      randomColor = Color.fromRGBO(
        math.Random().nextInt(256),
        math.Random().nextInt(256),
        math.Random().nextInt(256),
        0.5,
      );
    } while (randomColor.computeLuminance() > 0.3);
    return randomColor;
  }

  List<Widget> buildItems() {
    List<Widget> items = [];

    for (var subTitle in titleData.keys) {
      items.add(
        Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertPrompt(
                      title: subTitle,
                      prompt: titleData[subTitle]!,
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: EdgeInsets.all((2.5).screenWidth),
                width: (width).screenWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: randomColor(),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    subTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: maxLine,
                  ),
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
        viewportFraction: width / 100,
        enableInfiniteScroll: false,
        padEnds: false,
      ),
      items: buildItems(),
    );
  }
}
