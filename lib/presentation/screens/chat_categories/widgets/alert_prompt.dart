import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tradix/app/commons/extension/string.dart';
import 'package:tradix/app/routes/router.gr.dart';

class AlertPrompt extends StatelessWidget {
  final String title;
  final String prompt;

  const AlertPrompt({
    required this.title,
    required this.prompt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var systemMessageCubit = BlocProvider.of<SystemMessageCubit>(context);

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.only(
        top: 10.0,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 24.0),
      ),
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                prompt,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     "Mension Your ID ",
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Enter Id here', labelText: 'ID'),
            //   ),
            // ),
            Container(
              width: double.infinity,
              height: 60,
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // systemMessageCubit.update(prompt);
                  AutoRouter.of(context).pop();
                  AutoRouter.of(context).pushNamed(ChatRoute.name.path);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  "Submit",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
