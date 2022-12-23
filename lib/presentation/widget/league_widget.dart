import 'package:bet_flutter/domain/model/league_model.dart';
import 'package:flutter/widgets.dart';
import '../theme/bet_theme.dart';
import '../theme/bet_theme_constant.dart';

class LeagueWidget extends StatelessWidget {
  final League? league;

  const LeagueWidget(this.league, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: BetThemeConstant.IMAGE_SIZE,
          height: BetThemeConstant.IMAGE_SIZE,
          child: Image.network(league?.logo ?? ''),
        ),
        SizedBox(
            width: BetThemeConstant.MARGIN, height: BetThemeConstant.MARGIN),
        Text(
          league?.getLeagueTitle() ?? '',
          style: BetTheme().theme.textTheme.headline3,
        )
      ],
    );
  }
}