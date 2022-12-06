import 'package:bet_flutter/domain/util/y_log.dart';
import 'package:http/http.dart';

class HttpApi {

  String path;
  String host;
  Map<String, dynamic> query;
  Map<String, String> headers;

  HttpApi._(this.host, this.path, this.query, this.headers);

  Future request() {
    Uri uri = Uri.https(host, path, query);
    YLog.d("Uri: ${uri.toString()}");
    return get(
        uri,
        headers: headers
    );
  }
}

class HttpBuild {
  String path = "";
  String host = "";
  Map<String, dynamic> query = {};
  Map<String, String> headers = {};

  HttpBuild withHost(String host) {
    this.host = host;

    return this;
  }

  HttpBuild withPath(String path) {
    this.path = path;

    return this;
  }

  HttpBuild withQuery(Map<String, dynamic> query) {
    this.query = query;

    return this;
  }

  HttpBuild withHeaders(Map<String, String> headers) {
    this.headers = headers;

    return this;
  }

  HttpApi build() {
    return HttpApi._(host, path, query, headers);
  }
}
