import 'package:flutter/material.dart';
import 'package:todoapp/My_theme.dart';

import '../providers/appconfigprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: provider.appTheme == ThemeMode.light
            ? MyTheme.backgroundLight
            : MyTheme.backgroundDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeAppTheme(ThemeMode.light);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 30),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeAppTheme(ThemeMode.dark);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.dark,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: provider.appTheme == ThemeMode.light ? Colors.black : Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
