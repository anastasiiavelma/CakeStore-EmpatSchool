import 'package:flutter/material.dart';
import 'package:projects/utlis/constants.dart';
import 'package:projects/widgets/buttons/theme_widget_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Padding(
          padding: largePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Dark theme',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary)),
                  spacer,
                  const ThemeButton(),
                ],
              ),
            ],
          ),
        ));
  }
}
