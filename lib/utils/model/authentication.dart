import 'dart:convert';

AuthenticationModel authenticationModelFromJson(String str) =>
    AuthenticationModel.fromJson(json.decode(str));

String authenticationModelToJson(AuthenticationModel data) =>
    json.encode(data.toJson());

class AuthenticationModel {
  String message;
  String uid;
  String accessToken;

  AuthenticationModel({
    required this.message,
    required this.uid,
    required this.accessToken,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        message: json["message"],
        uid: json["uid"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "uid": uid,
        "access_token": accessToken,
      };
}
