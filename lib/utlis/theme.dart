import 'package:flutter/material.dart';

import './constants.dart';

ThemeData basicTheme(bool isDarkTheme, BuildContext context) => ThemeData(
    colorScheme: isDarkTheme
        ? ColorScheme.dark(
            //background
            background: kBackgroundColorDark,
            onBackground: kTextColorDark,

            // text
            secondary: kTextColorLight,
            // shadow for card
            shadow: kBackgroundColorDark,
            primary: kAccentColorDark,
          )
        : ColorScheme.light(
            //background
            background: kBackgroundColorLight,
            onBackground: kTextColorLight,

            // text
            secondary: kTextColorDark,
            // shadow for card
            shadow: kBackgroundColorDark,
            primary: kAccentColorLight,
          ));
