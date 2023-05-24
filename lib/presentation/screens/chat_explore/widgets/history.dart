import 'package:flutter/material.dart';

class History extends StatelessWidget {
  final String historyDateTime;
  final String firstMessage;
  final String secondMessage;

  const History({
    required this.historyDateTime,
    required this.firstMessage,
    required this.secondMessage,
    super.key,
  });

  Widget firstListTile() {
    return Row(
      children: [
        const SizedBox(
          width: 30,
          child: Icon(Icons.account_circle),
        ),
        const SizedBox(width: 12),
        Builder(
          builder: (BuildContext context) {
            return Flexible(
              child: Text(
                firstMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget secondListTile() {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            secondMessage,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xffEDEDED),
      ),
      child: Column(
        children: [
          Text(
            DateTime.parse(historyDateTime).toLocal().toString().split('.')[0],
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          firstListTile(),
          const SizedBox(height: 12),
          secondListTile(),
        ],
      ),
    );
  }
}
