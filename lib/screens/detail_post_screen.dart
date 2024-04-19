import 'package:flutter/material.dart';
import 'package:projects/models/item.dart';
import 'package:projects/utlis/constants.dart';

class PostDetailScreen extends StatefulWidget {
  final String postTitle;
  final String postText;
  const PostDetailScreen(
      {super.key, required this.postTitle, required this.postText});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  List<Item> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Post detail'),
        ),
        body: Padding(
          padding: largePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(widget.postTitle,
                  maxLines: 1,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary)),
              smallSizedBoxHeight,
              imagesDecoration,
              smallSizedBoxHeight,
              Text(widget.postText,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary)),
            ],
          ),
        ));
  }

  final imagesDecoration =
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Image.asset(
      'assets/images/item2.jpg',
      width: 100,
      height: 150,
      fit: BoxFit.cover,
    ),
    spacer,
    Image.asset(
      'assets/images/item1.jpg',
      width: 100,
      height: 150,
      fit: BoxFit.cover,
    ),
    spacer,
    Image.asset(
      'assets/images/item8.jpg',
      width: 100,
      height: 150,
      fit: BoxFit.cover,
    ),
  ]);
}
