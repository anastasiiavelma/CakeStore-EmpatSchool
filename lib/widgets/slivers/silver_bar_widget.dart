import 'package:flutter/material.dart';
import 'package:projects/widgets/buttons/theme_widget_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Cake-store',
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary, fontSize: 30.0),
      ),
      leading: const ThemeButton(),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
