import 'package:flutter/material.dart';
import 'package:todoapp/My_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/appconfigprovider.dart';

class LagnuageBottomSheet extends StatefulWidget {
  @override
  State<LagnuageBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<LagnuageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color:
            provider.appTheme == ThemeMode.light ? MyTheme.backgroundLight : MyTheme.backgroundDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeAppLang('en');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.english,
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
              provider.changeAppLang('ar');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.arabic,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
