import 'package:intl/intl.dart';
import '../../domain/model/fixture_model.dart';
import '../../domain/config/base_config.dart';
import 'http_api.dart';
import 'api_constant.dart';

class FixtureDataSource {
  List<Fixture> matchList = <Fixture>[];
  BaseConfig basicConfig;

  FixtureDataSource(this.basicConfig);

  Future getFixtureFromApi(DateTime dateTime) async {
    final query = {
      'timezone': "america/lima",
      'date': DateFormat("yyyy-MM-dd").format(dateTime),
    };

    return Build()
        .withHost(basicConfig.apiHost)
        .withPath(ApiConstant.GET_FIXTURE)
        .withQuery(query)
        .withHeaders(basicConfig.headers)
        .build()
        .request();
  }
}
