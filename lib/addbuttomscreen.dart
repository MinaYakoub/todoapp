import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todoapp/My_theme.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/appconfigprovider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime selectedDate = DateTime.now();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: provider.appTheme == ThemeMode.light
            ? Colors.white
            : MyTheme.backgroundTaskColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context)!.addnewtask,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                  ),
            ),
          ),
          Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!
                              .pleaseentertaskname;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)?.enteryourtask,
                          hintStyle:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: provider.appTheme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                                  )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!
                              .pleaseentertaskdis;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)?.tasldetails,
                          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: provider.appTheme == ThemeMode.light
                                        ? Colors.black
                                        : Colors.white,
                          )),
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      AppLocalizations.of(context)!.selecttime,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: provider.appTheme == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        showCalender();
                      },
                      child: Text(
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year} ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.save,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    selectedDate = chosenDate ?? selectedDate;
    setState(() {});
  }

  void addTask() {
    if (formkey.currentState?.validate() == true) {
      // add
    }
  }
}
