class Direction {
  Direction({
    this.step,
    this.text,
  });

  int step;
  String text;

  factory Direction.fromJson(Map<String, dynamic> json) => Direction(
        step: json["step"] == null ? null : json["step"],
        text: json["text"] == null ? null : json["text"],
      );
}
