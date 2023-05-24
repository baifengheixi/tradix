import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Category extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final Gradient backgroundGradient;

  const Category({
    required this.child,
    this.backgroundGradient = const LinearGradient(
      colors: [
        // Colors.black45,
        // Colors.black38,
        // Colors.black26,
        // Colors.black12,
        Colors.purpleAccent,
        Colors.purple,
        Colors.deepPurple,
        Colors.deepPurpleAccent,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0, 0.2, 0.5, 0.8],
    ),
    this.margin = const EdgeInsets.symmetric(horizontal: 24),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(20),
      width: 90.screenWidth,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: backgroundGradient,
      ),
      child: Align(
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
