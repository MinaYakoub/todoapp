import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/My_theme.dart';
import 'package:todoapp/edit_screen.dart';
import 'package:todoapp/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todoapp/providers/appconfigprovider.dart';
import 'package:todoapp/task_widget.dart';
import 'package:todoapp/tasks.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      locale:Locale(provider.appLanguage),
      initialRoute: HomeScreen.routeName,
      routes: {
          HomeScreen.routeName :(context) => HomeScreen(),
          EditScreen.routeName :(context) => EditScreen(),
        TaskWiget.routeName:(context) => TaskListScreen()
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkThme,
 themeMode: provider.appTheme,
    );
  }
}