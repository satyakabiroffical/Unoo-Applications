import 'dart:convert';

TrendingFundRaisers trendingFundRaisersFromJson(String str) =>
    TrendingFundRaisers.fromJson(json.decode(str));

String trendingFundRaisersToJson(TrendingFundRaisers data) =>
    json.encode(data.toJson());

class TrendingFundRaisers {
  String id;
  UserId userId;
  String fundType;
  String fundTitle;
  int fundAmount;
  String patient;
  String patientFullname;
  String patientAge;
  String alimentOrMedicalCondition;
  String hospitalisationStatus;
  String hospitalName;
  String educationQualification;
  String employmentStatus;
  String firstHearAbout;
  List<String> addFundraiserImageOrVideo;
  List<String> documents;
  String cityId;
  String stateId;
  String writeYourStory;
  String status;
  int fundRequired;
  int supporterCount;
  int percentage;
  int totalDonationAmount;
  int remainingDays;
  int totalViews;
  int todayViews;
  DateTime endDate;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  TrendingFundRaisers({
    required this.id,
    required this.userId,
    required this.fundType,
    required this.fundTitle,
    required this.fundAmount,
    required this.patient,
    required this.patientFullname,
    required this.patientAge,
    required this.alimentOrMedicalCondition,
    required this.hospitalisationStatus,
    required this.hospitalName,
    required this.educationQualification,
    required this.employmentStatus,
    required this.firstHearAbout,
    required this.addFundraiserImageOrVideo,
    required this.documents,
    required this.cityId,
    required this.stateId,
    required this.writeYourStory,
    required this.status,
    required this.fundRequired,
    required this.supporterCount,
    required this.percentage,
    required this.totalDonationAmount,
    required this.remainingDays,
    required this.totalViews,
    required this.todayViews,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TrendingFundRaisers.fromJson(Map<String, dynamic> json) =>
      TrendingFundRaisers(
        id: json["_id"] ?? '',
        userId: UserId.fromJson(json["userId"] ?? {}),
        fundType: json["fundType"] ?? '',
        fundTitle: json["fundTitle"] ?? '',
        fundAmount: json["fundAmount"] ?? 0,
        patient: json["patient"] ?? '',
        patientFullname: json["patientFullname"] ?? '',
        patientAge: json["patientAge"] ?? '',
        alimentOrMedicalCondition: json["alimentOrMedicalCondition"] ?? '',
        hospitalisationStatus: json["hospitalisationStatus"] ?? '',
        hospitalName: json["hospitalName"] ?? '',
        educationQualification: json["educationQualification"] ?? '',
        employmentStatus: json["employmentStatus"] ?? '',
        firstHearAbout: json["firstHearAbout"] ?? '',
        addFundraiserImageOrVideo: List<String>.from(
          json["addFundraiserImageORVideo"]?.map((x) => x) ?? [],
        ),
        documents: List<String>.from(json["documents"]?.map((x) => x) ?? []),
        cityId: json["cityId"] ?? '',
        stateId: json["stateId"] ?? '',
        writeYourStory: json["writeYourStory"] ?? '',
        status: json["status"] ?? '',
        fundRequired: json["fundRequired"] ?? 0,
        supporterCount: json["supporterCount"] ?? 0,
        percentage: json["percentage"] ?? 0,
        totalDonationAmount: json["totalDonationAmount"] ?? 0,
        remainingDays: json["remainingDays"] ?? 0,
        totalViews: json["totalViews"] ?? 0,
        todayViews: json["todayViews"] ?? 0,
        endDate: DateTime.tryParse(json["endDate"] ?? '') ?? DateTime.now(),
        createdAt: DateTime.tryParse(json["createdAt"] ?? '') ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json["updatedAt"] ?? '') ?? DateTime.now(),
        v: json["__v"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId.toJson(),
    "fundType": fundType,
    "fundTitle": fundTitle,
    "fundAmount": fundAmount,
    "patient": patient,
    "patientFullname": patientFullname,
    "patientAge": patientAge,
    "alimentOrMedicalCondition": alimentOrMedicalCondition,
    "hospitalisationStatus": hospitalisationStatus,
    "hospitalName": hospitalName,
    "educationQualification": educationQualification,
    "employmentStatus": employmentStatus,
    "firstHearAbout": firstHearAbout,
    "addFundraiserImageORVideo": List<dynamic>.from(
      addFundraiserImageOrVideo.map((x) => x),
    ),
    "documents": List<dynamic>.from(documents.map((x) => x)),
    "cityId": cityId,
    "stateId": stateId,
    "writeYourStory": writeYourStory,
    "status": status,
    "fundRequired": fundRequired,
    "supporterCount": supporterCount,
    "percentage": percentage,
    "totalDonationAmount": totalDonationAmount,
    "remainingDays": remainingDays,
    "totalViews": totalViews,
    "todayViews": todayViews,
    "endDate": endDate.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class UserId {
  String id;
  String name;

  UserId({required this.id, required this.name});

  factory UserId.fromJson(Map<String, dynamic> json) =>
      UserId(id: json["_id"] ?? '', name: json["name"] ?? '');

  Map<String, dynamic> toJson() => {"_id": id, "name": name};
}
