import 'package:bet_flutter/domain/config/base_config.dart';
import 'package:bet_flutter/presentation/config/environment.dart';
import 'package:bet_flutter/presentation/theme/bet_theme.dart';
import 'package:flutter/widgets.dart';
import 'bet_app.dart';

void runBetApp(BaseConfig baseConfig) {
  Environment().initConfig(baseConfig);
  BetTheme().initConfig(BetTheme.LIGHT);

  runApp(const BetApp());
}
