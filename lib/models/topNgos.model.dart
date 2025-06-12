import 'dart:convert';

TopNgos topNgosFromJson(String str) => TopNgos.fromJson(json.decode(str));

String topNgosToJson(TopNgos data) => json.encode(data.toJson());

class TopNgos {
  Journey journey;
  String id;
  String type;
  String userId;
  String name;
  String backGroundImage;
  String image;
  String about;
  String video;
  List<String> ngoImages;
  String headOfOrganization;
  String address;
  String website;
  String instagramUrl;
  String facebookUrl;
  String xurl;
  String youtubeUrl;
  String linkedInUrl;
  bool gov;
  List<Award> awards;
  List<dynamic> bloodCategory;
  String status;
  String cityId;
  String stateId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  TopNgos({
    required this.journey,
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

  factory TopNgos.fromJson(Map<String, dynamic> json) => TopNgos(
    journey: Journey.fromJson(json["journey"] ?? {}),
    id: json["_id"] ?? '',
    type: json["type"] ?? '',
    userId: json["userId"] ?? '',
    name: json["name"] ?? '',
    backGroundImage: json["backGroundImage"] ?? '',
    image: json["image"] ?? '',
    about: json["about"] ?? '',
    video: json["video"] ?? '',
    ngoImages: List<String>.from(json["ngoImages"]?.map((x) => x) ?? []),
    headOfOrganization: json["headOfOrganization"] ?? '',
    address: json["address"] ?? '',
    website: json["website"] ?? '',
    instagramUrl: json["instagramUrl"] ?? '',
    facebookUrl: json["facebookUrl"] ?? '',
    xurl: json["xurl"] ?? '',
    youtubeUrl: json["youtubeUrl"] ?? '',
    linkedInUrl: json["linkedInUrl"] ?? '',
    gov: json["gov"] ?? false,
    awards: List<Award>.from(
      json["awards"]?.map((x) => Award.fromJson(x)) ?? [],
    ),
    bloodCategory: List<dynamic>.from(
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
    "journey": journey.toJson(),
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
    "awards": List<dynamic>.from(awards.map((x) => x.toJson())),
    "bloodCategory": List<dynamic>.from(bloodCategory.map((x) => x)),
    "status": status,
    "cityId": cityId,
    "stateId": stateId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Award {
  String? name;
  String image;
  String year;
  String? location;
  String id;

  Award({
    this.name,
    required this.image,
    required this.year,
    this.location,
    required this.id,
  });

  factory Award.fromJson(Map<String, dynamic> json) => Award(
    name: json["name"],
    image: json["image"] ?? '',
    year: json["year"] ?? '',
    location: json["location"],
    id: json["_id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "year": year,
    "location": location,
    "_id": id,
  };
}

class Journey {
  String title;
  String description;
  String donationReceived;
  String careHomes;
  String image;

  Journey({
    required this.title,
    required this.description,
    required this.donationReceived,
    required this.careHomes,
    required this.image,
  });

  factory Journey.fromJson(Map<String, dynamic> json) => Journey(
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    donationReceived: json["donationReceived"] ?? '',
    careHomes: json["careHomes"] ?? '',
    image: json["image"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "donationReceived": donationReceived,
    "careHomes": careHomes,
    "image": image,
  };
}
