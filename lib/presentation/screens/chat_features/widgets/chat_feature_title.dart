import 'package:flutter/material.dart';

class ChatFeatureTitle extends StatelessWidget {
  final String title;

  const ChatFeatureTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.deepPurple,
        // fontFamily: 'Agne',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        // letterSpacing: 1.2,
      ),
    );
  }
}
