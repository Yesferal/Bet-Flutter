import 'package:bet_flutter/domain/model/league_model.dart';
import 'package:intl/intl.dart';
import 'teams_model.dart';

class Fixture {
  League? league;
  Teams? teams;
  double? probability;
  String? id;
  FixtureData? fixture;

  Fixture({this.id, this.fixture, this.probability, this.teams, this.league});

  Fixture.fromJson(Map json)
      : probability = double.parse(json['probability'].toString()),
        id = json['_id'],
        fixture = FixtureData.fromJson(json['fixture']),
        teams = Teams.fromJson(json['teams']),
        league = League.fromJson(json['league']);

  Map toJson() {
    return {'_id': id, 'fixture': fixture, 'probability': probability, 'teams': teams?.toJson(), 'league': league?.toJson()};
  }
}

class FixtureData {
  int? id;
  DateTime? date;

  FixtureData.fromJson(Map json)
      : id = json['id'],
        date = DateTime.parse(json['date']);

  Map toJson() {
    return {'id': id, 'date': date};
  }

  String getHour() {
    if (date == null) {
      return "";
    } else {
      return DateFormat("KK:mm a").format(date!);
    }
  }
}
