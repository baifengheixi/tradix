import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'Tradix',
            textStyle: const TextStyle(
              fontSize: 50.0,
              fontFamily: 'Horizon',
              letterSpacing: 5.5,
            ),
            colors: [
              Colors.purple,
              Colors.blue,
              Colors.red,
            ],
          ),
        ],
        isRepeatingAnimation: true,
      ),
    );
  }
}
