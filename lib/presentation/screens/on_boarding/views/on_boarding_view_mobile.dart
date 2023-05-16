import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';
import 'package:tradix/app/routes/router.dart';

class OnBoardingMobileView extends StatefulWidget {
  const OnBoardingMobileView({Key? key}) : super(key: key);

  @override
  State<OnBoardingMobileView> createState() => _OnBoardingMobileView();
}

class _OnBoardingMobileView extends State<OnBoardingMobileView> {
  final controller = PageController();
  final SharedPreferences _prefs = getIt<SharedPreferences>();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.screenWidth),
          child: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.screenWidth),
            child: GestureDetector(
              onTap: () {
                controller.jumpToPage(2);
              },
              child: const Center(
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              if (index == 2) {
                isLastPage = true;
              }
            });
          },
          children: [
            Stack(
              children: [
                Positioned(
                  top: 170,
                  right: 0,
                  child: Image.asset('assets/images/on_boarding/line_1.png'),
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/on_boarding/person_1.png',
                      height: 50.screenHeight,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.screenWidth),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start tot invest for your future!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Ex totam praesentium incidunt aut.',
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Stack(
              children: [
                Positioned(
                  top: 195,
                  width: 100.screenWidth,
                  child: Image.asset('assets/images/on_boarding/line_2.png'),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.screenWidth,
                        vertical: 16,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Follow our tipsto achieve success!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Ex totam praesentium incidunt aut.',
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/on_boarding/person_2.png',
                      height: 50.screenHeight,
                      width: double.infinity,
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  top: 40,
                  child: Image.asset('assets/images/on_boarding/line_3.png'),
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/on_boarding/person_3.png',
                      height: 50.screenHeight,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.screenWidth),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Keep your investment safe",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Ex totam praesentium incidunt aut.',
                            style: TextStyle(color: Colors.black26),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 15.screenHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.screenWidth),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  paintStyle: PaintingStyle.fill,
                  activeDotColor: Color(0xFFE432C1),
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.screenWidth),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF370BF0),
                      Color(0xFF9516E4),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (isLastPage) {
                      _prefs.setBool('hasInitApp', isLastPage).then((bool success) {
                        context.router.push(const HomeRoute());
                      });
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0.0),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
