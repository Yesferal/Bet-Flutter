import 'package:bet_flutter/domain/util/y_log.dart';
import 'package:bet_flutter/framework/http/http_data_source.dart';
import 'package:bet_flutter/presentation/config/environment.dart';
import 'package:bet_flutter/presentation/widget/fixture_card.dart';
import 'package:flutter/material.dart';
import '../../domain/model/fixture_model.dart';
import '../../domain/usecase/get_fixture_usecase.dart';

class FixtureList extends StatefulWidget {
  const FixtureList({super.key});

  @override
  _FixtureListState createState() => _FixtureListState();
}

class _FixtureListState extends State<FixtureList> {
  List<Fixture> matchList = <Fixture>[];

  void initFixture() async {
    // TODO: Move this part to DI class
    HttpDataSource fixtureDataSource = HttpDataSource(Environment().config);
    YLog.d("GetFixtureUseCase with FixtureDataSource!");
    var response = await GetFixtureUseCase(fixtureDataSource).execute(DateTime.now());
    setState(() {
      YLog.d("Updating data: ${response}");
      matchList = response;
    });
  }

  @override
  void initState() {
    super.initState();
    YLog.d("InitState!");
    initFixture();
  }

  @override
  Widget build(BuildContext context) {
    YLog.d("Widget Build!");
    return Scaffold(
        appBar: AppBar(
          title: Text(Environment().config.appName),
        ),
        body: ListView.builder(
            itemCount: matchList.length,
            itemBuilder: (context, index) {
              return FixtureCard(matchList[index]);
            }));
  }
}
