import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final String subTitle;
  final bool isShowMore;
  final VoidCallback? onTapShowMore;

  const SubTitleText({
    required this.subTitle,
    this.onTapShowMore,
    this.isShowMore = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            subTitle,
            style: const TextStyle(
              fontFamily: 'Agne',
              fontSize: 25,
              letterSpacing: 2.5,
            ),
          ),
          isShowMore
              ? GestureDetector(
                  onTap: onTapShowMore,
                  child: const Text(
                    'show more',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.deepPurple,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
