import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';
import 'package:projects/widgets/slivers/silver_bar_widget.dart';

class DetailItemScreen extends StatelessWidget {
  final Item item;
  const DetailItemScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(title: item.name, clipper: CustomClipPath())
        ],
      ),
    );
  }
}
