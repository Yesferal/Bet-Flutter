import 'package:bet_flutter/domain/model/fixture_model.dart';
import 'package:bet_flutter/presentation/widget/league_widget.dart';
import 'package:bet_flutter/presentation/widget/match_widget.dart';
import 'package:flutter/material.dart';
import '../navigation/navigation_constant.dart';
import '../theme/bet_theme_constant.dart';

class FixtureCard extends StatelessWidget {
  final Fixture fixture;

  const FixtureCard(this.fixture, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, BetNavigationConstant.FIXTURE_DETAIL,
              arguments: fixture);
        },
        child: Card(
            elevation: 2.0,
            margin: EdgeInsets.only(
                left: BetThemeConstant.MARGIN,
                right: BetThemeConstant.MARGIN,
                top: BetThemeConstant.MARGIN),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BetThemeConstant.MARGIN)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: BetThemeConstant.MARGIN,
                      left: BetThemeConstant.MARGIN,
                      right: BetThemeConstant.MARGIN),
                  child: LeagueWidget(fixture.league),
                ),
                Divider(
                  indent: BetThemeConstant.MARGIN,
                  endIndent: BetThemeConstant.MARGIN,
                  color: Colors.grey,
                ),
                MatchWidget(fixture.teams, fixture.fixture?.getHour() ?? ""),
                Slider(
                    min: 0,
                    max: 1,
                    value: fixture.probability ?? 0,
                    onChanged: null)
              ],
            )));
  }
}
