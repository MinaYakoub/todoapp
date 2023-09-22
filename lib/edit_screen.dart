import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditScreen extends StatefulWidget {
  static String routeName = 'edit';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime selectedDate = DateTime.now();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)!.app_title
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 400,
          width: 250,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.edittask,
                  style: Theme.of(context).textTheme.titleSmall,
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
                              hintText:
                                  AppLocalizations.of(context)?.thisistitle,
                              hintStyle:
                                  Theme.of(context).textTheme.titleSmall),
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
                              hintText:
                                  AppLocalizations.of(context)?.tasldetails,
                              hintStyle:
                                  Theme.of(context).textTheme.titleSmall),
                          maxLines: 3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          AppLocalizations.of(context)!.selecttime,
                          style: Theme.of(context).textTheme.titleSmall,
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
                            style: Theme.of(context).textTheme.titleSmall,
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
        ),
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
