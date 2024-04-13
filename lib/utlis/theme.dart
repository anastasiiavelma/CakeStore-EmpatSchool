import 'package:flutter/material.dart';

import './constants.dart';

ThemeData basicTheme(bool isDarkTheme, BuildContext context) => ThemeData(
    colorScheme: isDarkTheme
        ? ColorScheme.dark(
            //background green
            background: kBackgroundColorDark,
            // text
            secondary: kTextColorLight,
            // shadow for card
            shadow: kBackgroundColorDark,
            primary: kAccentColorDark,
          )
        : ColorScheme.light(
            //background green
            background: kBackgroundColorLight,
            // text
            secondary: kTextColorDark,
            // shadow for card
            shadow: kBackgroundColorDark,
            primary: kAccentColorLight,
          ));
