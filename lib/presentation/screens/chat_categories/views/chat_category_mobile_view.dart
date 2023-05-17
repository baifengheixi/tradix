import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/app/routes/router.gr.dart';

class ChatCategoryMobileView extends StatelessWidget {
  const ChatCategoryMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    myCarouselSlider(
        {List<String> items = const [
          "1",
          "2",
          "3",
          "4",
          "5",
        ]}) {
      return CarouselSlider(
        options: CarouselOptions(
          height: 15.screenHeight,
          viewportFraction: 0.4,
          enableInfiniteScroll: false,
          padEnds: false,
        ),
        items: items.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(
                    ChatRoute(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: EdgeInsets.all(2.5.screenWidth),
                  width: 200,
                  // constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      '$i',
                      style: const TextStyle(fontSize: 20.0),
                      maxLines: 2,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "History",
            style: TextStyle(fontSize: 32),
          ),
          myCarouselSlider(),
          SizedBox(height: 16),
          const Text(
            "Categories",
            style: TextStyle(fontSize: 32),
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 24),
              ),
              myCarouselSlider(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 24),
              ),
              myCarouselSlider(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 24),
              ),
              myCarouselSlider(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 24),
              ),
              myCarouselSlider(),
            ],
          ),
        ],
      ),
    );
  }
}
