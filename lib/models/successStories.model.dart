import 'dart:convert';

List<SuccessStories> successStoriesFromJson(String str) =>
    List<SuccessStories>.from(
      json.decode(str).map((x) => SuccessStories.fromJson(x)),
    );

String successStoriesToJson(List<SuccessStories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SuccessStories {
  String id;
  String name;
  String? image; // Made image nullable
  String? description; // Made description nullable
  bool disable;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  SuccessStories({
    required this.id,
    required this.name,
    this.image, // Nullable
    this.description, // Nullable
    required this.disable,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SuccessStories.fromJson(Map<String, dynamic> json) => SuccessStories(
    id: json["_id"] ?? '', // Default to empty string if null
    name: json["name"] ?? '', // Default to empty string if null
    image: json["image"], // Nullable, no default
    description: json["description"], // Nullable, no default
    disable: json["disable"] ?? false, // Default to false if null
    createdAt: DateTime.parse(
      json["createdAt"] ?? DateTime.now().toIso8601String(),
    ), // Default to now if null
    updatedAt: DateTime.parse(
      json["updatedAt"] ?? DateTime.now().toIso8601String(),
    ), // Default to now if null
    v: json["__v"] ?? 0, // Default to 0 if null
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image, // Nullable, no default
    "description": description, // Nullable, no default
    "disable": disable,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
