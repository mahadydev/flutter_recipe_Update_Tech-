import 'datum.dart';
import 'links.dart';
import 'meta.dart';

class Recipe {
  Recipe({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );
}
