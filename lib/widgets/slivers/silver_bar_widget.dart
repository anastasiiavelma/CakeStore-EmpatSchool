import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.settings,
              color: Theme.of(context).colorScheme.secondary),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
      title: Text(
        'Cake-store',
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
