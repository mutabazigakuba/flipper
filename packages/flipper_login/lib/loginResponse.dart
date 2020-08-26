// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.token,
        this.email,
        this.name,
        this.newUser,
        this.avatar,
        this.id,
        this.subscription,
        this.expiresAt,
    });

    String token;
    String email;
    String name;
    bool newUser;
    dynamic avatar;
    int id;
    dynamic subscription;
    dynamic expiresAt;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        email: json["email"],
        name: json["name"],
        newUser: json["newUser"],
        avatar: json["avatar"],
        id: json["id"],
        subscription: json["subscription"],
        expiresAt: json["expiresAt"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "email": email,
        "name": name,
        "newUser": newUser,
        "avatar": avatar,
        "id": id,
        "subscription": subscription,
        "expiresAt": expiresAt,
    };
}
