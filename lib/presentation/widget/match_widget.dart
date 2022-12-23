import 'package:flutter/widgets.dart';
import '../../domain/model/teams_model.dart';
import '../theme/bet_theme.dart';
import '../theme/bet_theme_constant.dart';

class MatchWidget extends StatelessWidget {
  final Teams? teams;
  final String hour;

  const MatchWidget(this.teams, this.hour, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(teams?.home?.name ?? "",
                style: BetTheme().theme.textTheme.bodyText1,
                textAlign: TextAlign.right)),
        SizedBox(
            width: BetThemeConstant.MARGIN, height: BetThemeConstant.MARGIN),
        SizedBox(
          width: BetThemeConstant.IMAGE_SIZE,
          height: BetThemeConstant.IMAGE_SIZE,
          child: Image.network(teams?.home?.logo ?? ''),
        ),
        Padding(
            padding: EdgeInsets.all(BetThemeConstant.MARGIN),
            child: Text(
              hour,
              style: BetTheme().theme.textTheme.subtitle1,
            )),
        SizedBox(
          width: BetThemeConstant.IMAGE_SIZE,
          height: BetThemeConstant.IMAGE_SIZE,
          child: Image.network(teams?.away?.logo ?? ''),
        ),
        SizedBox(
            width: BetThemeConstant.MARGIN, height: BetThemeConstant.MARGIN),
        Expanded(
            child: Text(teams?.away?.name ?? "",
                style: BetTheme().theme.textTheme.bodyText1))
      ],
    );
  }
}