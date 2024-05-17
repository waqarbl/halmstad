// To parse this JSON data, do
//
//     final interactionModel = interactionModelFromJson(jsonString);

import 'dart:convert';

InteractionModel interactionModelFromJson(String str) =>
    InteractionModel.fromJson(json.decode(str));

String interactionModelToJson(InteractionModel data) =>
    json.encode(data.toJson());

class InteractionModel {
  bool? success;
  List<Interaction>? data;

  InteractionModel({
    this.success,
    this.data,
  });

  factory InteractionModel.fromJson(Map<String, dynamic> json) =>
      InteractionModel(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Interaction>.from(
                json["data"]!.map((x) => Interaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Interaction {
  int? id;
  DateTime? activityTime;
  String? activityType;
  dynamic meetingType;
  InteractionDetails? interactionDetails;
  dynamic notes;
  dynamic followUpPlanned;
  dynamic attachments;
  dynamic meetingParticipants;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? workerId;
  int? locationId;
  int? groupId;
  int? focusAreaId;
  dynamic followUpActivityId;
  FocusArea? focusArea;
  FocusArea? group;
  Location? location;

  Interaction({
    this.id,
    this.activityTime,
    this.activityType,
    this.meetingType,
    this.interactionDetails,
    this.notes,
    this.followUpPlanned,
    this.attachments,
    this.meetingParticipants,
    this.createdAt,
    this.updatedAt,
    this.workerId,
    this.locationId,
    this.groupId,
    this.focusAreaId,
    this.followUpActivityId,
    this.focusArea,
    this.group,
    this.location,
  });

  factory Interaction.fromJson(Map<String, dynamic> json) => Interaction(
        id: json["id"],
        activityTime: json["activityTime"] == null
            ? null
            : DateTime.parse(json["activityTime"]),
        activityType: json["activityType"],
        meetingType: json["meetingType"],
        interactionDetails: json["interactionDetails"] == null
            ? null
            : InteractionDetails.fromJson(json["interactionDetails"]),
        notes: json["notes"],
        followUpPlanned: json["followUpPlanned"],
        attachments: json["attachments"],
        meetingParticipants: json["meetingParticipants"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        workerId: json["workerId"],
        locationId: json["locationId"],
        groupId: json["groupId"],
        focusAreaId: json["focusAreaId"],
        followUpActivityId: json["followUpActivityId"],
        focusArea: json["focusArea"] == null
            ? null
            : FocusArea.fromJson(json["focusArea"]),
        group: json["group"] == null ? null : FocusArea.fromJson(json["group"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activityTime": activityTime?.toIso8601String(),
        "activityType": activityType,
        "meetingType": meetingType,
        "interactionDetails": interactionDetails?.toJson(),
        "notes": notes,
        "followUpPlanned": followUpPlanned,
        "attachments": attachments,
        "meetingParticipants": meetingParticipants,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "workerId": workerId,
        "locationId": locationId,
        "groupId": groupId,
        "focusAreaId": focusAreaId,
        "followUpActivityId": followUpActivityId,
        "focusArea": focusArea?.toJson(),
        "group": group?.toJson(),
        "location": location?.toJson(),
      };
}

class FocusArea {
  int? id;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Member>? members;

  FocusArea({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.members,
  });

  factory FocusArea.fromJson(Map<String, dynamic> json) => FocusArea(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
      };
}

class Member {
  int? age;
  String? gender;
  String? disability;

  Member({
    this.age,
    this.gender,
    this.disability,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        age: json["age"],
        gender: json["gender"],
        disability: json["disability"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "gender": gender,
        "disability": disability,
      };
}

class InteractionDetails {
  bool? violenceType;
  bool? violenceObserved;
  bool? substanceUseObserved;

  InteractionDetails({
    this.violenceType,
    this.violenceObserved,
    this.substanceUseObserved,
  });

  factory InteractionDetails.fromJson(Map<String, dynamic> json) =>
      InteractionDetails(
        violenceType: json["violence_type"],
        violenceObserved: json["violence_observed"],
        substanceUseObserved: json["substance_use_observed"],
      );

  Map<String, dynamic> toJson() => {
        "violence_type": violenceType,
        "violence_observed": violenceObserved,
        "substance_use_observed": substanceUseObserved,
      };
}

class Location {
  int? id;
  String? title;
  String? address;
  String? plusCode;
  dynamic placeId;
  String? locationType;
  Coordinates? coordinates;
  DateTime? createdAt;
  DateTime? updatedAt;

  Location({
    this.id,
    this.title,
    this.address,
    this.plusCode,
    this.placeId,
    this.locationType,
    this.coordinates,
    this.createdAt,
    this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        plusCode: json["plusCode"],
        placeId: json["placeId"],
        locationType: json["locationType"],
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "plusCode": plusCode,
        "placeId": placeId,
        "locationType": locationType,
        "coordinates": coordinates?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({
    this.lat,
    this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
