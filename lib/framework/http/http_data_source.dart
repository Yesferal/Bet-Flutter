import 'package:intl/intl.dart';
import '../../domain/model/fixture_model.dart';
import '../../domain/config/base_config.dart';
import 'http_api.dart';
import 'api_constant.dart';

class HttpDataSource {
  List<Fixture> matchList = <Fixture>[];
  BaseConfig basicConfig;

  HttpDataSource(this.basicConfig);

  Future getFixtureFromApi(DateTime dateTime) async {
    final query = {
      'timezone': "america/lima",
      'date': DateFormat("yyyy-MM-dd").format(dateTime),
    };

    return HttpBuild()
        .withHost(basicConfig.apiHosts[basicConfig.apiHostSelected])
        .withPath(ApiConstant.GET_FIXTURE)
        .withQuery(query)
        .withHeaders(basicConfig.headers)
        .build()
        .request();
  }
}
