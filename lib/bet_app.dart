import 'package:bet_flutter/presentation/navigation/navigation_constant.dart';
import 'package:bet_flutter/presentation/screen/fixture_detail_screen.dart';
import 'package:bet_flutter/presentation/screen/fixture_list_screen.dart';
import 'package:bet_flutter/presentation/screen/settings_screen.dart';
import 'package:bet_flutter/presentation/theme/bet_theme.dart';
import 'package:flutter/material.dart';

class BetApp extends StatelessWidget {
  const BetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = BetTheme().theme;
    return MaterialApp(
      title: 'JustBet',
      theme: theme,
      routes: {
        BetNavigationConstant.HOME_SCREEN: (context) => const FixtureList(),
        BetNavigationConstant.FIXTURE_DETAIL_SCREEN: (context) => const FixtureDetail(),
        BetNavigationConstant.SETTINGS_SCREEN: (context) => const SettingsScreen()
      },
    );
  }
}
