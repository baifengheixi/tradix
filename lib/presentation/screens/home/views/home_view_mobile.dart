import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradix/app/routes/router.gr.dart';
import 'package:tradix/business_logic/blocs/bottom_nav/bottom_nav_bloc.dart';
import 'package:tradix/presentation/screens/home/widgets/bottom_nav.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavBloc = BlocProvider.of<BottomNavBloc>(context);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: AutoTabsScaffold(
          routes: const [
            ChatCategoryRoute(),
            ImageCategoryRoute(),
            SettingRoute(),
            SettingRoute(),
          ],
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBuilder: (_, tabsRouter) {
            return BlocBuilder<BottomNavBloc, BottomNavState>(
              builder: (context, state) {
                return BottomNav(
                  activeIndex: context.read<BottomNavBloc>().state.index,
                  onTap: (index) {
                    bottomNavBloc.add(BottomNavUpdateIndexEvent(index: index));
                    tabsRouter.setActiveIndex(index);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
