import 'package:recipe_app_updatetechltd/models/source.dart';

import 'direction.dart';
import 'ingredients.dart';

class Datum {
  Datum({
    this.id,
    this.title,
    this.servings,
    this.totalTime,
    this.prepTime,
    this.cookTime,
    this.imageUrl,
    this.sourceUrl,
    this.notes,
    this.createdAt,
    this.source,
    this.ingredients,
    this.directions,
  });

  String id;
  String title;
  int servings;
  int totalTime;
  dynamic prepTime;
  dynamic cookTime;
  String imageUrl;
  String sourceUrl;
  String notes;
  dynamic createdAt;
  Source source;
  List<Ingredient> ingredients;
  List<Direction> directions;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        servings: json["servings"] == null ? null : json["servings"],
        totalTime: json["total_time"] == null ? null : json["total_time"],
        prepTime: json["prep_time"],
        cookTime: json["cook_time"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        sourceUrl: json["source_url"] == null ? null : json["source_url"],
        notes: json["notes"] == null ? null : json["notes"],
        createdAt: json["created_at"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        ingredients: json["ingredients"] == null
            ? null
            : List<Ingredient>.from(
                json["ingredients"].map((x) => Ingredient.fromJson(x))),
        directions: json["directions"] == null
            ? null
            : List<Direction>.from(
                json["directions"].map((x) => Direction.fromJson(x))),
      );
}
