
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/My_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todoapp/edit_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/appconfigprovider.dart';
class TaskWiget extends StatelessWidget {
  static String routeName = 'task';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Slidable(
      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion:  ScrollMotion(),
        // All actions are defined in the children parameter.
        children: [
          
          // A SlidableAction can have an icon and/or a label.
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 1),
              height: 80,
              width: 81,
              child: SlidableAction(
                
                flex: 1,
                borderRadius: BorderRadius.circular(15),
                onPressed: (context) {},
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: AppLocalizations.of(context)!.delete,
              ),
            ),
          ),
          Container(
            height: 80,
            width: 80,
            child: SlidableAction(
              flex: 1,
              borderRadius: BorderRadius.circular(15),
              onPressed: (context) {
                Navigator.pushNamed(context, EditScreen.routeName);
              },
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.edit,
            ),
          ),
        ],
      ),
      // The end action pane is the one at the right or the bottom side.
      child: Container(
          margin: EdgeInsets.symmetric(vertical:15),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: provider.appTheme==ThemeMode.light ? Colors.white : MyTheme.backgroundTaskColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                color: provider.appTheme==ThemeMode.light ? MyTheme.primarylight : MyTheme.primaryDark,
                width: 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('0000',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: MyTheme.primarylight)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('000'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.primarylight),
                    onPressed: () {},
                    child: Icon(Icons.check)),
              )
            ],
          )),
    );
  }
}
