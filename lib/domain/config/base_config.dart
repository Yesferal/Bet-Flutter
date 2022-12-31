abstract class BaseConfig {

  String get appName;

  int get apiHostSelected => 0;

  List<String> get apiHosts;

  Map<String, String> get headers;
}
