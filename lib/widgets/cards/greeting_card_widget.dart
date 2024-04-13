import 'package:flutter/material.dart';
import 'package:projects/utlis/constants.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({super.key});

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
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome to Our Store!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            smallSizedBoxHeight,
            const InformationAboutStore(),
            smallSizedBoxHeight,
            const LocationStore(),
          ],
        ),
      ),
    );
  }
}

class InformationAboutStore extends StatelessWidget {
  const InformationAboutStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'We offer a wide range of products to meet your needs. Whether you\'re looking for groceries, household items, electronics, or fashion, we have it all!',
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        Icon(
          Icons.cake_outlined,
          color: Theme.of(context).colorScheme.primary,
          size: 40.0,
        ),
      ],
    );
  }
}

class LocationStore extends StatelessWidget {
  const LocationStore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(
          width: 3.0,
        ),
        Text(
          'Kyiv, Ukraine',
          style: TextStyle(
            fontSize: 16.0,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
