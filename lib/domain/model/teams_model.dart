import 'package:bet_flutter/domain/model/team_model.dart';

class Teams {
  Team? home;
  Team? away;

  Teams({this.home, this.away});

  Teams.fromJson(Map json)
      : home = Team.fromJson(json['home']),
        away = Team.fromJson(json['away']);

  Map toJson() {
    return {'home': home?.toJson(), 'away': away?.toJson()};
  }
}
