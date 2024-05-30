// To parse this JSON data, do
//
//     final interactionModel = interactionModelFromJson(jsonString);

import 'dart:convert';

import 'package:halmstad/models/memberModel.dart';

InteractionModel interactionModelFromJson(String str) =>
    InteractionModel.fromJson(json.decode(str));

String interactionModelToJson(InteractionModel data) =>
    json.encode(data.toJson());

class InteractionModel {
  bool success;
  List<Interaction> data;

  InteractionModel({
    required this.success,
    required this.data,
  });

  factory InteractionModel.fromJson(Map<String, dynamic> json) =>
      InteractionModel(
        success: json["success"],
        data: List<Interaction>.from(
            json["data"].map((x) => Interaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Interaction {
  int id;
  String interationTitle;
  String interationDes;
  dynamic followupnotes;
  DateTime activityTime;
  String activityType;
  dynamic meetingType;
  InteractionDetails interactionDetails;
  dynamic notes;
  dynamic followUpPlanned;
  dynamic attachments;
  dynamic meetingParticipants;
  DateTime createdAt;
  DateTime updatedAt;
  int workerId;
  int locationId;
  int groupId;
  int focusAreaId;
  dynamic followUpActivityId;
  FocusArea focusArea;
  FocusArea group;
  Location location;

  Interaction({
    required this.id,
    required this.interationTitle,
    required this.interationDes,
    required this.followupnotes,
    required this.activityTime,
    required this.activityType,
    required this.meetingType,
    required this.interactionDetails,
    required this.notes,
    required this.followUpPlanned,
    required this.attachments,
    required this.meetingParticipants,
    required this.createdAt,
    required this.updatedAt,
    required this.workerId,
    required this.locationId,
    required this.groupId,
    required this.focusAreaId,
    required this.followUpActivityId,
    required this.focusArea,
    required this.group,
    required this.location,
  });

  factory Interaction.fromJson(Map<String, dynamic> json) => Interaction(
        id: json["id"],
        interationTitle: json["interationTitle"],
        interationDes: json["interationDes"],
        followupnotes: json["followupnotes"],
        activityTime: DateTime.parse(json["activityTime"]),
        activityType: json["activityType"],
        meetingType: json["meetingType"],
        interactionDetails:
            InteractionDetails.fromJson(json["interactionDetails"]),
        notes: json["notes"],
        followUpPlanned: json["followUpPlanned"],
        attachments: json["attachments"],
        meetingParticipants: json["meetingParticipants"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        workerId: json["workerId"],
        locationId: json["locationId"],
        groupId: json["groupId"],
        focusAreaId: json["focusAreaId"],
        followUpActivityId: json["followUpActivityId"],
        focusArea: FocusArea.fromJson(json["focusArea"]),
        group: FocusArea.fromJson(json["group"]),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "interationTitle": interationTitle,
        "interationDes": interationDes,
        "followupnotes": followupnotes,
        "activityTime": activityTime.toIso8601String(),
        "activityType": activityType,
        "meetingType": meetingType,
        "interactionDetails": interactionDetails.toJson(),
        "notes": notes,
        "followUpPlanned": followUpPlanned,
        "attachments": attachments,
        "meetingParticipants": meetingParticipants,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "workerId": workerId,
        "locationId": locationId,
        "groupId": groupId,
        "focusAreaId": focusAreaId,
        "followUpActivityId": followUpActivityId,
        "focusArea": focusArea.toJson(),
        "group": group.toJson(),
        "location": location.toJson(),
      };
}

class FocusArea {
  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<Member>? members;

  FocusArea({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.members,
  });

  factory FocusArea.fromJson(Map<String, dynamic> json) => FocusArea(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        members: json["members"] == null
            ? []
            : List<Member>.from(
                json["members"]!.map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "members": members == null
            ? []
            : List<dynamic>.from(members!.map((x) => x.toJson())),
      };
}

class InteractionDetails {
  bool violenceType;
  bool violenceObserved;
  bool substanceUseObserved;

  InteractionDetails({
    required this.violenceType,
    required this.violenceObserved,
    required this.substanceUseObserved,
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
  int id;
  String title;
  String address;
  String plusCode;
  dynamic placeId;
  String locationType;
  Coordinates coordinates;
  DateTime createdAt;
  DateTime updatedAt;

  Location({
    required this.id,
    required this.title,
    required this.address,
    required this.plusCode,
    required this.placeId,
    required this.locationType,
    required this.coordinates,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        plusCode: json["plusCode"],
        placeId: json["placeId"],
        locationType: json["locationType"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "plusCode": plusCode,
        "placeId": placeId,
        "locationType": locationType,
        "coordinates": coordinates.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Coordinates {
  double lat;
  double lng;

  Coordinates({
    required this.lat,
    required this.lng,
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
