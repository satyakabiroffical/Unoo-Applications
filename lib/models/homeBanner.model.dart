import 'dart:convert';

List<HomeBanner> homeBannerFromJson(String str) =>
    List<HomeBanner>.from(json.decode(str).map((x) => HomeBanner.fromJson(x)));

String homeBannerToJson(List<HomeBanner> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeBanner {
  String title;
  String description;
  String image;
  String id;

  HomeBanner({
    required this.title,
    required this.description,
    required this.image,
    required this.id,
  });

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    image: json["image"] ?? "",
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "image": image,
    "_id": id,
  };
}
