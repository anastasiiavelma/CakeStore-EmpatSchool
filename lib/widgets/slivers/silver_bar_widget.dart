import 'package:flutter/material.dart';
import 'package:projects/utlis/constants.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Cake-store',
        style: TextStyle(color: kBackgroundColor, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: kButtonsColor,
    );
  }
}
