import 'package:flutter/material.dart';

import '../utilities/constants.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      background: Constants.kBackgroundColor,
      primaryContainer: Constants.kprimaryContainerColor,
      tertiaryContainer: Constants.kContainerColor,
      secondaryContainer: Constants.ksecondaryContainerColor,
      primary: Constants.kTextdarkColor),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      background: Constants.kDarkBackgroundColor,
      primaryContainer: Constants.kDarkprimaryContainerColor,
      tertiaryContainer: Constants.kDarkContainerColor,
      secondaryContainer: Constants.kDarksecondaryContainerColor,
      primary: Constants.kTextColor,
      brightness: Brightness.dark),
);
