import 'package:bet_flutter/domain/util/y_log.dart';
import 'package:bet_flutter/framework/http/http_data_source.dart';
import 'package:bet_flutter/presentation/config/environment.dart';
import 'package:bet_flutter/presentation/navigation/navigation_constant.dart';
import 'package:bet_flutter/presentation/theme/bet_theme.dart';
import 'package:bet_flutter/presentation/theme/bet_theme_constant.dart';
import 'package:flutter/material.dart';
import '../../domain/model/fixture_model.dart';
import '../../domain/usecase/get_fixture_usecase.dart';

class FixtureList extends StatefulWidget {
  FixtureList({super.key});

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
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      BetNavigationConstant.FIXTURE_DETAIL,
                      arguments: matchList[index]
                    );
                  },
                  child: Card(
                      elevation: 2.0,
                      margin: EdgeInsets.only(
                          left: BetThemeConstant.MARGIN,
                          right: BetThemeConstant.MARGIN,
                          top: BetThemeConstant.MARGIN),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(BetThemeConstant.MARGIN)),
                      child: ListTile(
                          title: Column(
                            children: [
                              _getLeagueWidget(matchList[index]),
                              const Divider(
                                color: Colors.grey,
                              )
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              _getMatchWidget(matchList[index]),
                              _getProbabilityWidget(matchList[index])
                            ],
                          ))));
            }));
  }

  Widget _getLeagueWidget(Fixture fixture) {
    return Row(
      children: [
        SizedBox(
          width: BetThemeConstant.IMAGE_SIZE,
          height: BetThemeConstant.IMAGE_SIZE,
          child: Image.network(fixture.league?.logo ?? ''),
        ),
        SizedBox(
            width: BetThemeConstant.MARGIN, height: BetThemeConstant.MARGIN),
        Text(
          fixture.league?.getLeagueTitle() ?? '',
          style: BetTheme().theme.textTheme.headline3,
        )
      ],
    );
  }

  Widget _getMatchWidget(Fixture fixture) {
    return Row(
      children: [
        Expanded(
            child: Text(fixture.teams?.home?.name ?? "",
                style: BetTheme().theme.textTheme.bodyText1,
                textAlign: TextAlign.right)),
        SizedBox(
            width: BetThemeConstant.MARGIN, height: BetThemeConstant.MARGIN),
        SizedBox(
          width: BetThemeConstant.IMAGE_SIZE,
          height: BetThemeConstant.IMAGE_SIZE,
          child: Image.network(fixture.teams?.home?.logo ?? ''),
        ),
        Padding(
            padding: EdgeInsets.all(BetThemeConstant.MARGIN),
            child: Text(
              fixture.fixture?.getHour() ?? "",
              style: BetTheme().theme.textTheme.subtitle1,
            )),
        SizedBox(
          width: BetThemeConstant.IMAGE_SIZE,
          height: BetThemeConstant.IMAGE_SIZE,
          child: Image.network(fixture.teams?.away?.logo ?? ''),
        ),
        SizedBox(
            width: BetThemeConstant.MARGIN, height: BetThemeConstant.MARGIN),
        Expanded(
            child: Text(fixture.teams?.away?.name ?? "",
                style: BetTheme().theme.textTheme.bodyText1))
      ],
    );
  }

  Widget _getProbabilityWidget(Fixture fixture) {
    return Slider(
        min: 0, max: 1, value: fixture.probability ?? 0, onChanged: null);
  }
}
