import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tradix/presentation/screens/chat_explore/widgets/category.dart';

class Feature extends StatelessWidget {
  final String title;

  const Feature({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 120,
      child: Category(
        child: AutoSizeText(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
