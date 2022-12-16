import 'dart:ui';
import 'package:flutter/material.dart';

abstract class BetColorTheme {
  Color get bodyText;
  Color get subtitleText;
  Color get appBarText;
  Color get activeBackgroundButton;
  Color get inactiveBackgroundButton;
  Color get foregroundButton;
  Brightness get brightness;
}

class BetColorLightTheme implements BetColorTheme {
  @override
  Color get bodyText => Colors.black;

  @override
  Color get appBarText => Colors.white;

  @override
  Color get subtitleText => Colors.grey;

  @override
  Color get activeBackgroundButton => Colors.green;

  @override
  Color get inactiveBackgroundButton => Colors.green[100] ?? Colors.grey;

  @override
  Color get foregroundButton => Colors.white;

  @override
  Brightness get brightness => Brightness.light;
}

class BetColorDarkTheme implements BetColorTheme {
  @override
  Color get bodyText => Colors.white;

  @override
  Color get appBarText => Colors.white;

  @override
  Color get subtitleText => Colors.grey;

  @override
  Color get activeBackgroundButton => Colors.green;

  @override
  Color get inactiveBackgroundButton => Colors.green[100] ?? Colors.grey;

  @override
  Color get foregroundButton => Colors.white;

  @override
  Brightness get brightness => Brightness.dark;
}
