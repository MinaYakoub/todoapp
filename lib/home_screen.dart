
import 'package:flutter/material.dart';
import 'package:todoapp/My_theme.dart';
import 'package:todoapp/addbuttomscreen.dart';
import 'package:todoapp/providers/appconfigprovider.dart';
import 'package:todoapp/settingsfolder/settings.dart';
import 'package:todoapp/tasks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {    int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {  
      var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.app_title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(  
        shape: CircularNotchedRectangle(),
        color: provider.appTheme==ThemeMode.light? Colors.white : MyTheme.backgroundTaskColor,
        notchMargin: 10,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: AppLocalizations.of(context)!.taskList),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: AppLocalizations.of(context)!.settings)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:provider.appTheme==ThemeMode.light ? MyTheme.primarylight :MyTheme.primaryDark ,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 4.5, color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          showAddBottomSheet();
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [TaskListScreen(), settingsScreen()];
  
  void showAddBottomSheet() {
    showModalBottomSheet(context: context, builder:(context)=>AddTaskScreen() );
  }
}
