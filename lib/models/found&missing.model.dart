import 'dart:convert';

List<FoundAndMissing> foundAndMissingFromJson(String str) =>
    List<FoundAndMissing>.from(
      json.decode(str).map((x) => FoundAndMissing.fromJson(x)),
    );

String foundAndMissingToJson(List<FoundAndMissing> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoundAndMissing {
  String id;
  String type;
  String userId;
  List<String> image;
  String name;
  int? mobile; // Made mobile nullable
  String? email; // Made email nullable
  String? address; // Made address nullable
  String? productName; // Made productName nullable
  String? description; // Made description nullable
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  FoundAndMissing({
    required this.id,
    required this.type,
    required this.userId,
    required this.image,
    required this.name,
    this.mobile, // Nullable
    this.email, // Nullable
    this.address, // Nullable
    this.productName, // Nullable
    this.description, // Nullable
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory FoundAndMissing.fromJson(Map<String, dynamic> json) =>
      FoundAndMissing(
        id: json["_id"] ?? '', // Default to empty string if null
        type: json["type"] ?? '', // Default to empty string if null
        userId: json["userId"] ?? '', // Default to empty string if null
        image: List<String>.from(
          json["image"]?.map((x) => x) ?? [],
        ), // Default to empty list if null
        name: json["name"] ?? '', // Default to empty string if null
        mobile: json["mobile"], // Nullable, no default
        email: json["email"], // Nullable, no default
        address: json["address"], // Nullable, no default
        productName: json["productName"], // Nullable, no default
        description: json["description"], // Nullable, no default
        status: json["status"] ?? '', // Default to empty string if null
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
    "type": type,
    "userId": userId,
    "image": List<dynamic>.from(image.map((x) => x)),
    "name": name,
    "mobile": mobile, // Nullable, no default
    "email": email, // Nullable, no default
    "address": address, // Nullable, no default
    "productName": productName, // Nullable, no default
    "description": description, // Nullable, no default
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
