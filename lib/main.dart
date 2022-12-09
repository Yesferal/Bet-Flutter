import 'package:bet_flutter/presentation/config/environment.dart';
import 'package:bet_flutter/presentation/fixture_state.dart';
import 'package:bet_flutter/presentation/theme/bet_theme.dart';
import 'package:flutter/material.dart';

void main() {
  const String environment = String.fromEnvironment(
    'ENV',
    defaultValue: Environment.DEV,
  );
  Environment().initConfig(environment);
  BetTheme().initConfig(BetTheme.LIGHT);

  runApp(const BetApp());
}

class BetApp extends StatelessWidget {
  const BetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = BetTheme().theme;
    return MaterialApp(
      title: 'JustBet',
      theme: theme,
      home: FixtureList(),
    );
  }
}
