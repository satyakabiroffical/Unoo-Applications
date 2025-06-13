import 'dart:convert';

FundDetails fundDetailsFromJson(String str) =>
    FundDetails.fromJson(json.decode(str));

String fundDetailsToJson(FundDetails data) => json.encode(data.toJson());

class FundDetails {
  FundRaise fundRaise;
  List<Contribution> topContribution;
  List<Contribution> contributions;
  List<Comment> comments;
  CompanyAccount companyAccount;

  FundDetails({
    required this.fundRaise,
    required this.topContribution,
    required this.contributions,
    required this.comments,
    required this.companyAccount,
  });

  factory FundDetails.fromJson(Map<String, dynamic> json) => FundDetails(
    fundRaise:
        json["fundRaise"] != null
            ? FundRaise.fromJson(json["fundRaise"])
            : FundRaise.empty(),
    topContribution:
        json["topContribution"] != null
            ? List<Contribution>.from(
              json["topContribution"].map((x) => Contribution.fromJson(x)),
            )
            : [],
    contributions:
        json["contributions"] != null
            ? List<Contribution>.from(
              json["contributions"].map((x) => Contribution.fromJson(x)),
            )
            : [],
    comments:
        json["comments"] != null
            ? List<Comment>.from(
              json["comments"].map((x) => Comment.fromJson(x)),
            )
            : [],
    companyAccount:
        json["companyAccount"] != null
            ? CompanyAccount.fromJson(json["companyAccount"])
            : CompanyAccount.empty(),
  );

  Map<String, dynamic> toJson() => {
    "fundRaise": fundRaise.toJson(),
    "topContribution": List<dynamic>.from(
      topContribution.map((x) => x.toJson()),
    ),
    "contributions": List<dynamic>.from(contributions.map((x) => x.toJson())),
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    "companyAccount": companyAccount.toJson(),
  };
}

class Comment {
  String id;
  UserId? userId;
  String description;
  String fundRaiseId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Comment({
    required this.id,
    this.userId,
    required this.description,
    required this.fundRaiseId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["_id"]?.toString() ?? '',
    userId: json["userId"] != null ? UserId.fromJson(json["userId"]) : null,
    description: json["description"]?.toString() ?? '',
    fundRaiseId: json["fundRaiseId"]?.toString() ?? '',
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"].toString())
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"].toString())
            : DateTime.now(),
    v:
        json["__v"] is int
            ? json["__v"]
            : int.tryParse(json["__v"]?.toString() ?? '0') ?? 0,
  );

  factory Comment.empty() => Comment(
    id: '',
    description: '',
    fundRaiseId: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    v: 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId?.toJson(),
    "description": description,
    "fundRaiseId": fundRaiseId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class UserId {
  String id;
  String name;
  String userImage;
  String? email;
  String? address;

  UserId({
    required this.id,
    required this.name,
    required this.userImage,
    this.email,
    this.address,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"]?.toString() ?? '',
    name: json["name"]?.toString() ?? '',
    userImage: json["userImage"]?.toString() ?? '',
    email: json["email"]?.toString(),
    address: json["address"]?.toString(),
  );

  factory UserId.empty() => UserId(id: '', name: '', userImage: '');

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "userImage": userImage,
    "email": email,
    "address": address,
  };
}

class CompanyAccount {
  String id;
  String accountType;
  String ifsc;
  String accountName;
  int accountNumber;

  CompanyAccount({
    required this.id,
    required this.accountType,
    required this.ifsc,
    required this.accountName,
    required this.accountNumber,
  });

  factory CompanyAccount.fromJson(Map<String, dynamic> json) => CompanyAccount(
    id: json["_id"]?.toString() ?? '',
    accountType: json["AccountType"]?.toString() ?? '',
    ifsc: json["IFSC"]?.toString() ?? '',
    accountName: json["accountName"]?.toString() ?? '',
    accountNumber:
        json["accountNumber"] is int
            ? json["accountNumber"]
            : int.tryParse(json["accountNumber"]?.toString() ?? '0') ?? 0,
  );

  factory CompanyAccount.empty() => CompanyAccount(
    id: '',
    accountType: '',
    ifsc: '',
    accountName: '',
    accountNumber: 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "AccountType": accountType,
    "IFSC": ifsc,
    "accountName": accountName,
    "accountNumber": accountNumber,
  };
}

class Contribution {
  int tipAmount;
  bool hide;
  String id;
  String? donationTitle;
  String? donationType;
  int donationAmount;
  String paymentMethod;
  String transactionId;
  String fundRaiseFor;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  UserId? userId;
  String? name;
  String? email;
  String? firstName;
  String? lastName;

  Contribution({
    required this.tipAmount,
    required this.hide,
    required this.id,
    this.donationTitle,
    this.donationType,
    required this.donationAmount,
    required this.paymentMethod,
    required this.transactionId,
    required this.fundRaiseFor,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.userId,
    this.name,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory Contribution.fromJson(Map<String, dynamic> json) => Contribution(
    tipAmount:
        json["tipAmount"] is int
            ? json["tipAmount"]
            : int.tryParse(json["tipAmount"]?.toString() ?? '0') ?? 0,
    hide:
        json["hide"] is bool
            ? json["hide"]
            : json["hide"]?.toString().toLowerCase() == 'true',
    id: json["_id"]?.toString() ?? '',
    donationTitle: json["donationTitle"]?.toString(),
    donationType: json["donationType"]?.toString(),
    donationAmount:
        json["donationAmount"] is int
            ? json["donationAmount"]
            : int.tryParse(json["donationAmount"]?.toString() ?? '0') ?? 0,
    paymentMethod: json["paymentMethod"]?.toString() ?? '',
    transactionId: json["transactionId"]?.toString() ?? '',
    fundRaiseFor: json["fundRaiseFor"]?.toString() ?? '',
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"].toString())
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"].toString())
            : DateTime.now(),
    v:
        json["__v"] is int
            ? json["__v"]
            : int.tryParse(json["__v"]?.toString() ?? '0') ?? 0,
    userId: json["userId"] != null ? UserId.fromJson(json["userId"]) : null,
    name: json["name"]?.toString(),
    email: json["email"]?.toString(),
    firstName: json["firstName"]?.toString(),
    lastName: json["lastName"]?.toString(),
  );

  factory Contribution.empty() => Contribution(
    tipAmount: 0,
    hide: false,
    id: '',
    donationAmount: 0,
    paymentMethod: '',
    transactionId: '',
    fundRaiseFor: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    v: 0,
  );

  Map<String, dynamic> toJson() => {
    "tipAmount": tipAmount,
    "hide": hide,
    "_id": id,
    "donationTitle": donationTitle,
    "donationType": donationType,
    "donationAmount": donationAmount,
    "paymentMethod": paymentMethod,
    "transactionId": transactionId,
    "fundRaiseFor": fundRaiseFor,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "userId": userId?.toJson(),
    "name": name,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
  };
}

class FundRaise {
  String id;
  UserId userId;
  String fundType;
  int fundAmount;
  String fundTitle;
  String ngoName;
  String ngoFundRaiseCause;
  String educationQualification;
  String employmentStatus;
  String firstHearAbout;
  List<String> addFundraiserImageOrVideo;
  String writeYourStory;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<String> documents;
  int fundRequired;
  int percentage;
  int supporterCount;
  int totalDonationAmount;
  int remainingDays;
  int todayViews;
  int totalViews;
  DateTime endDate;

  FundRaise({
    required this.id,
    required this.userId,
    required this.fundType,
    required this.fundAmount,
    required this.fundTitle,
    required this.ngoName,
    required this.ngoFundRaiseCause,
    required this.educationQualification,
    required this.employmentStatus,
    required this.firstHearAbout,
    required this.addFundraiserImageOrVideo,
    required this.writeYourStory,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.documents,
    required this.fundRequired,
    required this.percentage,
    required this.supporterCount,
    required this.totalDonationAmount,
    required this.remainingDays,
    required this.todayViews,
    required this.totalViews,
    required this.endDate,
  });

  factory FundRaise.fromJson(Map<String, dynamic> json) => FundRaise(
    id: json["_id"]?.toString() ?? '',
    userId:
        json["userId"] != null
            ? UserId.fromJson(json["userId"])
            : UserId.empty(),
    fundType: json["fundType"]?.toString() ?? '',
    fundAmount:
        json["fundAmount"] is int
            ? json["fundAmount"]
            : int.tryParse(json["fundAmount"]?.toString() ?? '0') ?? 0,
    fundTitle: json["fundTitle"]?.toString() ?? '',
    ngoName: json["ngoName"]?.toString() ?? '',
    ngoFundRaiseCause: json["NgoFundRaiseCause"]?.toString() ?? '',
    educationQualification: json["educationQualification"]?.toString() ?? '',
    employmentStatus: json["employmentStatus"]?.toString() ?? '',
    firstHearAbout: json["firstHearAbout"]?.toString() ?? '',
    addFundraiserImageOrVideo:
        json["addFundraiserImageORVideo"] is List
            ? List<String>.from(
              json["addFundraiserImageORVideo"].map((x) => x?.toString() ?? ''),
            )
            : [],
    writeYourStory: json["writeYourStory"]?.toString() ?? '',
    status: json["status"]?.toString() ?? '',
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"].toString())
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"].toString())
            : DateTime.now(),
    v:
        json["__v"] is int
            ? json["__v"]
            : int.tryParse(json["__v"]?.toString() ?? '0') ?? 0,
    documents:
        json["documents"] is List
            ? List<String>.from(
              json["documents"].map((x) => x?.toString() ?? ''),
            )
            : [],
    fundRequired:
        json["fundRequired"] is int
            ? json["fundRequired"]
            : int.tryParse(json["fundRequired"]?.toString() ?? '0') ?? 0,
    percentage:
        json["percentage"] is int
            ? json["percentage"]
            : int.tryParse(json["percentage"]?.toString() ?? '0') ?? 0,
    supporterCount:
        json["supporterCount"] is int
            ? json["supporterCount"]
            : int.tryParse(json["supporterCount"]?.toString() ?? '0') ?? 0,
    totalDonationAmount:
        json["totalDonationAmount"] is int
            ? json["totalDonationAmount"]
            : int.tryParse(json["totalDonationAmount"]?.toString() ?? '0') ?? 0,
    remainingDays:
        json["remainingDays"] is int
            ? json["remainingDays"]
            : int.tryParse(json["remainingDays"]?.toString() ?? '0') ?? 0,
    todayViews:
        json["todayViews"] is int
            ? json["todayViews"]
            : int.tryParse(json["todayViews"]?.toString() ?? '0') ?? 0,
    totalViews:
        json["totalViews"] is int
            ? json["totalViews"]
            : int.tryParse(json["totalViews"]?.toString() ?? '0') ?? 0,
    endDate:
        json["endDate"] != null
            ? DateTime.parse(json["endDate"].toString())
            : DateTime.now().add(const Duration(days: 30)),
  );

  factory FundRaise.empty() => FundRaise(
    id: '',
    userId: UserId.empty(),
    fundType: '',
    fundAmount: 0,
    fundTitle: '',
    ngoName: '',
    ngoFundRaiseCause: '',
    educationQualification: '',
    employmentStatus: '',
    firstHearAbout: '',
    addFundraiserImageOrVideo: [],
    writeYourStory: '',
    status: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    v: 0,
    documents: [],
    fundRequired: 0,
    percentage: 0,
    supporterCount: 0,
    totalDonationAmount: 0,
    remainingDays: 0,
    todayViews: 0,
    totalViews: 0,
    endDate: DateTime.now().add(const Duration(days: 30)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId.toJson(),
    "fundType": fundType,
    "fundAmount": fundAmount,
    "fundTitle": fundTitle,
    "ngoName": ngoName,
    "NgoFundRaiseCause": ngoFundRaiseCause,
    "educationQualification": educationQualification,
    "employmentStatus": employmentStatus,
    "firstHearAbout": firstHearAbout,
    "addFundraiserImageORVideo": List<dynamic>.from(
      addFundraiserImageOrVideo.map((x) => x),
    ),
    "writeYourStory": writeYourStory,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "documents": List<dynamic>.from(documents.map((x) => x)),
    "fundRequired": fundRequired,
    "percentage": percentage,
    "supporterCount": supporterCount,
    "totalDonationAmount": totalDonationAmount,
    "remainingDays": remainingDays,
    "todayViews": todayViews,
    "totalViews": totalViews,
    "endDate": endDate.toIso8601String(),
  };
}
