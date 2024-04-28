import 'package:flutter/material.dart';
import 'package:projects/utlis/constants.dart';

class GreetingCard extends StatelessWidget {
  final int? cartTotalPrice;
  const GreetingCard({super.key, required this.cartTotalPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.shadow,
      elevation: 10.0,
      child: Padding(
        padding: smallPadding,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Your total price in cart: $cartTotalPrice',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome to Our Store!',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const InformationAboutStore(),
            smallSizedBoxHeight,
          ],
        ),
      ),
    );
  }
}

class InformationAboutStore extends StatefulWidget {
  const InformationAboutStore({
    super.key,
  });

  @override
  State<InformationAboutStore> createState() => _InformationAboutStoreState();
}

class _InformationAboutStoreState extends State<InformationAboutStore>
    with SingleTickerProviderStateMixin {
  late final Animation _animation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.0,
      end: 2.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            'We offer a wide range of products to meet your needs. Whether you\'re looking for groceries, household items, electronics, or fashion, we have it all!',
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + _animation.value * 0.2,
                child: Image.asset(
                  height: 150,
                  width: 190,
                  'assets/images/cake.png',
                ),
              );
            }),
      ],
    );
  }
}
