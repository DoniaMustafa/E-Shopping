



import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    required this.user,
    required this.token,
    required this.message,
    required this.status,
  });

  final User user;
  final String token;
  final String message;
  final int status;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    user: User.fromJson(json["user"]),
    token: json["token"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
    "message": message,
    "status": status,
  };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String fullName;
  final String email;
  final String password;
  final List<String> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    fullName: json["fullName"],
    email: json["email"],
    password: json["password"],
    products: List<String>.from(json["products"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fullName": fullName,
    "email": email,
    "password": password,
    "products": List<dynamic>.from(products.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
