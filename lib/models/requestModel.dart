// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

List<RequestModel> requestModelFromJson(String str) => List<RequestModel>.from(
    json.decode(str).map((x) => RequestModel.fromJson(x)));

String requestModelToJson(List<RequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestModel {
  int id;
  String requestType;
  DateTime time;
  String source;
  String natureOfRequest;
  String tipCategory;
  String requestCategory;
  String urgency;
  String status;
  String notes;
  String detailedAddress;
  dynamic attachments;
  bool resolved;
  DateTime createdAt;
  DateTime updatedAt;
  int locationId;
  int assignedToId;
  int createdById;
  Location location;
  AssignedTo assignedTo;
  AssignedTo createdBy;

  RequestModel({
    required this.id,
    required this.requestType,
    required this.time,
    required this.source,
    required this.natureOfRequest,
    required this.tipCategory,
    required this.requestCategory,
    required this.urgency,
    required this.status,
    required this.notes,
    required this.detailedAddress,
    required this.attachments,
    required this.resolved,
    required this.createdAt,
    required this.updatedAt,
    required this.locationId,
    required this.assignedToId,
    required this.createdById,
    required this.location,
    required this.assignedTo,
    required this.createdBy,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["id"],
        requestType: json["requestType"],
        time: DateTime.parse(json["time"]),
        source: json["source"],
        natureOfRequest: json["natureOfRequest"],
        tipCategory: json["tipCategory"],
        requestCategory: json["requestCategory"],
        urgency: json["urgency"],
        status: json["status"],
        notes: json["notes"],
        detailedAddress: json["detailedAddress"],
        attachments: json["attachments"],
        resolved: json["resolved"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        locationId: json["locationId"],
        assignedToId: json["assignedToId"],
        createdById: json["createdById"],
        location: Location.fromJson(json["location"]),
        assignedTo: AssignedTo.fromJson(json["assignedTo"]),
        createdBy: AssignedTo.fromJson(json["createdBy"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "requestType": requestType,
        "time": time.toIso8601String(),
        "source": source,
        "natureOfRequest": natureOfRequest,
        "tipCategory": tipCategory,
        "requestCategory": requestCategory,
        "urgency": urgency,
        "status": status,
        "notes": notes,
        "detailedAddress": detailedAddress,
        "attachments": attachments,
        "resolved": resolved,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "locationId": locationId,
        "assignedToId": assignedToId,
        "createdById": createdById,
        "location": location.toJson(),
        "assignedTo": assignedTo.toJson(),
        "createdBy": createdBy.toJson(),
      };
}

class AssignedTo {
  String firstName;
  String lastName;

  AssignedTo({
    required this.firstName,
    required this.lastName,
  });

  factory AssignedTo.fromJson(Map<String, dynamic> json) => AssignedTo(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
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
