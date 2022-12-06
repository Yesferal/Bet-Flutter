import 'dart:convert';
import 'package:bet_flutter/framework/http/fixture_data_source.dart';
import '../model/fixture_model.dart';
import '../util/y_log.dart';

class GetFixtureUseCase {
  FixtureDataSource fixtureDataSource;

  GetFixtureUseCase(this.fixtureDataSource);

  Future<List<Fixture>> execute(DateTime dateTime) async {
    var response = await fixtureDataSource.getFixtureFromApi(dateTime);
    YLog.d("GetFixture: ${response.body}");
    Iterable list = json.decode(response.body);
    return list.map((model) => Fixture.fromJson(model)).toList();
  }
}
