
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todoapp/My_theme.dart';
import 'package:todoapp/providers/appconfigprovider.dart';
import 'package:todoapp/settingsfolder/LanguageBottomSheet.dart';
import 'package:todoapp/settingsfolder/ThemeBottomSheet.dart';
import 'package:provider/provider.dart';

class settingsScreen extends StatefulWidget {

  @override
  State<settingsScreen> createState() => _settingsScreenState();
}

class _settingsScreenState extends State<settingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor:provider.appTheme ==ThemeMode.light ? MyTheme.backgroundLight : MyTheme.backgroundDark,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(AppLocalizations.of(context)!.language, style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: provider.appTheme == ThemeMode.light ? Colors.black : Colors.white,
              fontSize: 20
            ),),
          ),
          InkWell(
            onTap: (){
              showLanguageBottomSheet(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                border:Border.all(color: Colors.blue),
                color: Colors.white
              ),
              height: 50,
              width: 290,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:5),
                  child: Text( provider.appLanguage =='en' ? AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic ,style: TextStyle(
                    color: Colors.blue
                  ),),
                ), 
                Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
              ],
            ),
            ),
          ), 
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              AppLocalizations.of(context)!.mode,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: provider.appTheme == ThemeMode.light ? Colors.black : Colors.white, fontSize: 20),
            ),
          ),
          InkWell(
            onTap: (){
              showThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(left: 30),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue), color: Colors.white),
              height: 50,
              width: 290,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      provider.appTheme==ThemeMode.light ?  AppLocalizations.of(context)!.light  :AppLocalizations.of(context)!.dark  ,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down_sharp, color: Colors.blue)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: false,
      
      context: context, builder: (context)=>LagnuageBottomSheet()
      );
  }
  void showThemeBottomSheet(){
    showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
  }
}