import 'package:bet_flutter/domain/config/base_config.dart';

class DevConfig extends BaseConfig {
  @override
  String get appName => "Just Bet Dev";

  @override
  String get apiHost => '';

  @override
  Map<String, String> get headers => {
    '': ''
  };
}
