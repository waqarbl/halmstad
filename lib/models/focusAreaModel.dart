// To parse this JSON data, do
//
//     final focusAreas = focusAreasFromJson(jsonString);

import 'dart:convert';

FocusAreas focusAreasFromJson(String str) =>
    FocusAreas.fromJson(json.decode(str));

String focusAreasToJson(FocusAreas data) => json.encode(data.toJson());

class FocusAreas {
  bool success;
  List<FocusAreaInModel> data;

  FocusAreas({
    required this.success,
    required this.data,
  });

  factory FocusAreas.fromJson(Map<String, dynamic> json) => FocusAreas(
        success: json["success"],
        data: List<FocusAreaInModel>.from(
            json["data"].map((x) => FocusAreaInModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FocusAreaInModel {
  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  FocusAreaInModel({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FocusAreaInModel.fromJson(Map<String, dynamic> json) =>
      FocusAreaInModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
