import 'dart:convert';

List<TopBloodBanks> topBloodBanksFromJson(String str) =>
    List<TopBloodBanks>.from(
      json.decode(str).map((x) => TopBloodBanks.fromJson(x)),
    );

String topBloodBanksToJson(List<TopBloodBanks> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopBloodBanks {
  String id;
  String type;
  String userId;
  String name;
  String backGroundImage;
  String image;
  String about;
  String video;
  List<dynamic> ngoImages;
  String headOfOrganization;
  String address;
  String website;
  String instagramUrl;
  String facebookUrl;
  String xurl;
  String youtubeUrl;
  String linkedInUrl;
  bool gov;
  List<dynamic> awards;
  List<String> bloodCategory;
  String status;
  String cityId;
  String stateId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  TopBloodBanks({
    required this.id,
    required this.type,
    required this.userId,
    required this.name,
    required this.backGroundImage,
    required this.image,
    required this.about,
    required this.video,
    required this.ngoImages,
    required this.headOfOrganization,
    required this.address,
    required this.website,
    required this.instagramUrl,
    required this.facebookUrl,
    required this.xurl,
    required this.youtubeUrl,
    required this.linkedInUrl,
    required this.gov,
    required this.awards,
    required this.bloodCategory,
    required this.status,
    required this.cityId,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TopBloodBanks.fromJson(Map<String, dynamic> json) => TopBloodBanks(
    id: json["_id"] ?? '',
    type: json["type"] ?? '',
    userId: json["userId"] ?? '',
    name: json["name"] ?? '',
    backGroundImage: json["backGroundImage"] ?? '',
    image: json["image"] ?? '',
    about: json["about"] ?? '',
    video: json["video"] ?? '',
    ngoImages: List<dynamic>.from(json["ngoImages"]?.map((x) => x) ?? []),
    headOfOrganization: json["headOfOrganization"] ?? '',
    address: json["address"] ?? '',
    website: json["website"] ?? '',
    instagramUrl: json["instagramUrl"] ?? '',
    facebookUrl: json["facebookUrl"] ?? '',
    xurl: json["xurl"] ?? '',
    youtubeUrl: json["youtubeUrl"] ?? '',
    linkedInUrl: json["linkedInUrl"] ?? '',
    gov: json["gov"] ?? false,
    awards: List<dynamic>.from(json["awards"]?.map((x) => x) ?? []),
    bloodCategory: List<String>.from(
      json["bloodCategory"]?.map((x) => x) ?? [],
    ),
    status: json["status"] ?? '',
    cityId: json["cityId"] ?? '',
    stateId: json["stateId"] ?? '',
    createdAt: DateTime.tryParse(json["createdAt"] ?? '') ?? DateTime.now(),
    updatedAt: DateTime.tryParse(json["updatedAt"] ?? '') ?? DateTime.now(),
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type": type,
    "userId": userId,
    "name": name,
    "backGroundImage": backGroundImage,
    "image": image,
    "about": about,
    "video": video,
    "ngoImages": List<dynamic>.from(ngoImages.map((x) => x)),
    "headOfOrganization": headOfOrganization,
    "address": address,
    "website": website,
    "instagramUrl": instagramUrl,
    "facebookUrl": facebookUrl,
    "xurl": xurl,
    "youtubeUrl": youtubeUrl,
    "linkedInUrl": linkedInUrl,
    "gov": gov,
    "awards": List<dynamic>.from(awards.map((x) => x)),
    "bloodCategory": List<dynamic>.from(bloodCategory.map((x) => x)),
    "status": status,
    "cityId": cityId,
    "stateId": stateId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
