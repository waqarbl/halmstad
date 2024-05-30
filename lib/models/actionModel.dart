// To parse this JSON data, do
//
//     final actionModel = actionModelFromJson(jsonString);

import 'dart:convert';

ActionModel actionModelFromJson(String str) =>
    ActionModel.fromJson(json.decode(str));

String actionModelToJson(ActionModel data) => json.encode(data.toJson());

class ActionModel {
  bool success;
  List<Action> data;

  ActionModel({
    required this.success,
    required this.data,
  });

  factory ActionModel.fromJson(Map<String, dynamic> json) => ActionModel(
        success: json["success"],
        data: List<Action>.from(json["data"].map((x) => Action.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Action {
  int id;
  String activityType;
  String actionType;
  String description;
  DateTime actionTime;
  String outcomeType;
  String outcomeDetails;
  DateTime createdAt;
  DateTime updatedAt;
  int activityId;

  Action({
    required this.id,
    required this.activityType,
    required this.actionType,
    required this.description,
    required this.actionTime,
    required this.outcomeType,
    required this.outcomeDetails,
    required this.createdAt,
    required this.updatedAt,
    required this.activityId,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        id: json["id"],
        activityType: json["activityType"],
        actionType: json["actionType"],
        description: json["description"],
        actionTime: DateTime.parse(json["actionTime"]),
        outcomeType: json["outcomeType"],
        outcomeDetails: json["outcomeDetails"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        activityId: json["activityId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activityType": activityType,
        "actionType": actionType,
        "description": description,
        "actionTime": actionTime.toIso8601String(),
        "outcomeType": outcomeType,
        "outcomeDetails": outcomeDetails,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "activityId": activityId,
      };
}
