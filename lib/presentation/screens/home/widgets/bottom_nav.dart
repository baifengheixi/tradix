import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  BottomNav({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

  final Function(int) onTap;
  final int activeIndex;
  final List<IconData> _bottomNavIcons = [
    Icons.home,
    Icons.search,
    Icons.shopping_cart,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: _bottomNavIcons,
      activeColor: Colors.blue,
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 16,
      rightCornerRadius: 16,
      onTap: onTap,
    );
  }
}
