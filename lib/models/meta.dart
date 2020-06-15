class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );
}
