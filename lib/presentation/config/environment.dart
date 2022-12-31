import '../../domain/config/base_config.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  late BaseConfig config;

  initConfig(BaseConfig baseConfig) {
    config = baseConfig;
  }
}
