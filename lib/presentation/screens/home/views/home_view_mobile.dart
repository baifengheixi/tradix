import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tradix/app/routes/router.gr.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var bottomNavBloc = BlocProvider.of<BottomNavBloc>(context);

    return Container(
      color: Colors.white,
      child: const SafeArea(
        child: AutoTabsScaffold(
          routes: [
            ChatExploreRoute(),
            ImageCategoryRoute(),
            SettingRoute(),
            SettingRoute(),
          ],
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          // ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBuilder: (_, tabsRouter) {
          //   return BlocBuilder<BottomNavBloc, BottomNavState>(
          //     builder: (context, state) {
          //       return BottomNav(
          //         activeIndex: context.read<BottomNavBloc>().state.index,
          //         onTap: (index) {
          //           bottomNavBloc.add(BottomNavUpdateIndexEvent(index: index));
          //           tabsRouter.setActiveIndex(index);
          //         },
          //       );
          //     },
          //   );
          // },
        ),
      ),
    );
  }
}
