// To parse this JSON data, do
//
//     final meetingModel = meetingModelFromJson(jsonString);

import 'dart:convert';

import 'package:halmstad/models/memberModel.dart';

MeetingModel meetingModelFromJson(String str) =>
    MeetingModel.fromJson(json.decode(str));

String meetingModelToJson(MeetingModel data) => json.encode(data.toJson());

class MeetingModel {
  bool success;
  List<Meeting> data;

  MeetingModel({
    required this.success,
    required this.data,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) => MeetingModel(
        success: json["success"],
        data: List<Meeting>.from(json["data"].map((x) => Meeting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Meeting {
  DateTime activityTime;
  String notes;
  bool followUpPlanned;
  String detailedAddress;
  int groupId;
  Group group;

  Meeting({
    required this.activityTime,
    required this.notes,
    required this.followUpPlanned,
    required this.detailedAddress,
    required this.groupId,
    required this.group,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        activityTime: DateTime.parse(json["activityTime"]),
        notes: json["notes"],
        followUpPlanned: json["followUpPlanned"],
        detailedAddress: json["detailedAddress"],
        groupId: json["groupId"],
        group: Group.fromJson(json["group"]),
      );

  Map<String, dynamic> toJson() => {
        "activityTime": activityTime.toIso8601String(),
        "notes": notes,
        "followUpPlanned": followUpPlanned,
        "detailedAddress": detailedAddress,
        "groupId": groupId,
        "group": group.toJson(),
      };
}

class Group {
  int id;
  String title;
  String description;
  List<Member> members;
  DateTime createdAt;
  DateTime updatedAt;

  Group({
    required this.id,
    required this.title,
    required this.description,
    required this.members,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        members:
            List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
