class Source {
  Source({
    this.name,
    this.siteUrl,
    this.imageUrl,
  });

  String name;
  String siteUrl;
  String imageUrl;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        name: json["name"] == null ? null : json["name"],
        siteUrl: json["site_url"] == null ? null : json["site_url"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
      );
}
