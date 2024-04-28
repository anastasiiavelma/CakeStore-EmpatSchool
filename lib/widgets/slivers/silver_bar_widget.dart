import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.title,
    required this.clipper,
    this.actions,
  }) : super(key: key);

  final String title;
  final CustomClipper<Path> clipper;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 1.0,
      expandedHeight: 150.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
        child: ClipPath(
          clipper: clipper,
          child: Container(
            height: 200,
            color: Theme.of(context).colorScheme.onBackground,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 70.0, 5.0),
                child: Text(
                  title,
                  style: GoogleFonts.dmSerifDisplay(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      actions: actions,
      centerTitle: true,
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    path.quadraticBezierTo(-130, height + 160, width + 130, height - 130);
    path.quadraticBezierTo(width + 60, height - 170, width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
