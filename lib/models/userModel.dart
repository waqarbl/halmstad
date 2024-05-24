// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int httpStatus;
  String status;
  String message;
  User user;

  UserModel({
    required this.httpStatus,
    required this.status,
    required this.message,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        httpStatus: json["httpStatus"],
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "status": status,
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String email;
  String password;
  String salt;
  String token;
  String firstName;
  String lastName;
  String veriCode;
  bool verified;
  dynamic veriCodeExp;
  String status;
  String role;
  dynamic devices;
  Contact contact;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.salt,
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.veriCode,
    required this.verified,
    required this.veriCodeExp,
    required this.status,
    required this.role,
    required this.devices,
    required this.contact,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        salt: json["salt"],
        token: json["token"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        veriCode: json["veriCode"],
        verified: json["verified"],
        veriCodeExp: json["veriCodeExp"],
        status: json["status"],
        role: json["role"],
        devices: json["devices"],
        contact: Contact.fromJson(json["contact"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "salt": salt,
        "token": token,
        "firstName": firstName,
        "lastName": lastName,
        "veriCode": veriCode,
        "verified": verified,
        "veriCodeExp": veriCodeExp,
        "status": status,
        "role": role,
        "devices": devices,
        "contact": contact.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Contact {
  Contact();

  factory Contact.fromJson(Map<String, dynamic> json) => Contact();

  Map<String, dynamic> toJson() => {};
}
