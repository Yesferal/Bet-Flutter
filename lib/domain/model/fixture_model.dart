import 'package:bet_flutter/domain/model/league_model.dart';
import 'teams_model.dart';

class Fixture {
  League? league;
  Teams? teams;
  double? probability;
  String? id;

  Fixture({this.id, this.probability, this.teams, this.league});

  Fixture.fromJson(Map json)
      : probability = double.parse(json['probability'].toString()),
        id = json['_id'],
        teams = Teams.fromJson(json['teams']),
        league = League.fromJson(json['league']);

  Map toJson() {
    return {'_id': id, 'probability': probability, 'teams': teams?.toJson(), 'league': league?.toJson()};
  }

  String getFixtureTitle() {
    return "${teams?.home?.name} - ${teams?.away?.name}";
  }
}
