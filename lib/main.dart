import 'package:bet_flutter/presentation/config/environment.dart';
import 'package:bet_flutter/presentation/fixture_state.dart';
import 'package:flutter/material.dart';

void main() {
  const String environment = String.fromEnvironment(
    'ENV',
    defaultValue: Environment.DEV,
  );
  Environment().initConfig(environment);

  runApp(const BetApp());
}

class BetApp extends StatelessWidget {
  const BetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'JustBet',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: FixtureList(),
    );
  }
}
