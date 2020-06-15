class Unit {
  Unit({
    this.id,
    this.name,
    this.abbreviation,
    this.namePlural,
    this.abbreviationPlural,
  });

  String id;
  String name;
  String abbreviation;
  String namePlural;
  String abbreviationPlural;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        abbreviation:
            json["abbreviation"] == null ? null : json["abbreviation"],
        namePlural: json["name_plural"] == null ? null : json["name_plural"],
        abbreviationPlural: json["abbreviation_plural"] == null
            ? null
            : json["abbreviation_plural"],
      );
}
