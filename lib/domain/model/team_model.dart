class Team {
  String? name;
  String? logo;
  int? points;
  int? roundsPlayed;

  Team({ this.name, this.logo, this.points, this.roundsPlayed });

  Team.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        logo = json['logo'],
        points = json['points'],
        roundsPlayed = json['roundsPlayed'];

  Map toJson() {
    return {'name': name, 'logo': logo, 'points': points, 'roundsPlayed': roundsPlayed };
  }
}
