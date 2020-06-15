import 'unit.dart';

class Ingredient {
  Ingredient({
    this.id,
    this.name,
    this.description,
    this.preparation,
    this.quantity,
    this.displayQuantity,
    this.unit,
  });

  int id;
  String name;
  String description;
  String preparation;
  String quantity;
  String displayQuantity;
  Unit unit;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        preparation: json["preparation"] == null ? null : json["preparation"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        displayQuantity:
            json["display_quantity"] == null ? null : json["display_quantity"],
        unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
      );
}
