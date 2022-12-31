import 'package:bet_flutter/domain/config/base_config.dart';

class DevConfig extends BaseConfig {
  @override
  String get appName => "Just Bet Dev";

  @override
  List<String> get apiHosts => ['demo8819092.mockable.io'];

  @override
  Map<String, String> get headers => {};
}
