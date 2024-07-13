import 'package:flutter/material.dart';

import '../utilities/constants.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      background: Constants.kBackgroundColor,
      primaryContainer: Constants.kPrimaryContainerColor,
      tertiaryContainer: Constants.kContainerColor,
      secondaryContainer: Constants.kSecondaryContainerColor,
      primary: Constants.kTextDarkColor),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      background: Constants.kDarkBackgroundColor,
      primaryContainer: Constants.kDarkPrimaryContainerColor,
      tertiaryContainer: Constants.kDarkContainerColor,
      secondaryContainer: Constants.kDarkSecondaryContainerColor,
      primary: Constants.kTextColor,
      brightness: Brightness.dark),
);
