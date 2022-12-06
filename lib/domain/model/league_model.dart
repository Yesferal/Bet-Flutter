class League {
  String? name;
  String? logo;
  String? country;
  String? season;

  League.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        logo = json['logo'],
        country = json['country'],
        season = json['season'];

  Map toJson() {
    return {'name': name, 'logo': logo, 'country': country, 'season': season };
  }
}
