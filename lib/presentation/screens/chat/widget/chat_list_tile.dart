import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChatListTile extends StatelessWidget {
  final bool isUserMessage;
  final String message;

  final aiIcon = Image.asset('assets/images/logo.png');
  final userIcon = const Icon(Icons.account_circle);

  ChatListTile({
    required this.isUserMessage,
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: isUserMessage ? Colors.transparent : const Color(0xffEDEDED),
      leading: SizedBox(
        width: 8.screenWidth,
        height: 8.screenWidth,
        child: isUserMessage ? userIcon : aiIcon,
      ),
      title: Tooltip(
        onTriggered: () {
          Clipboard.setData(ClipboardData(text: message));
        },
        message: "Copied",
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.screenWidth),
          child: Text(message),
        ),
      ),
      // title: MarkdownBody(
      //   data: message,
      //   extensionSet: md.ExtensionSet(
      //     md.ExtensionSet.gitHubFlavored.blockSyntaxes,
      //     [md.EmojiSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
      //   ),
      // ),
    );
  }
}
