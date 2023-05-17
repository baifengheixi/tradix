import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingMobileView extends StatelessWidget {
  const SettingMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // final t = Localizations.of<AppLocalizations>(context, AppLocalizations);

    return Center(
      child: Text(
        AppLocalizations.of(context)!.helloWorld,
      ),
    );
  }
}
