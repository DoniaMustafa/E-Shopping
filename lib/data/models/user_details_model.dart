// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    required this.user,
    required this.message,
    required this.status,
  });

  final User user;
  final String message;
  final int status;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        user: User.fromJson(json["user"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
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
  final List<Product> products;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        password: json["password"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "password": password,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Product {
  Product({
    required this.productOptions,
    required this.id,
    required this.productName,
    required this.productVariants,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final ProductOptions productOptions;
  final String id;
  final String productName;
  final List<ProductVariants> productVariants;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productOptions: ProductOptions.fromJson(json["productOptions"]),
        id: json["_id"],
        productName: json["productName"],
        productVariants: List<ProductVariants>.from(
            json["productVariants"].map((x) => ProductVariants.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "productOptions": productOptions.toJson(),
        "_id": id,
        "productName": productName,
        "productVariants":
            List<dynamic>.from(productVariants.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class ProductOptions {
  ProductOptions({
    required this.productSizes,
    required this.productColors,
  });

  final List<String> productSizes;
  final List<ProductColor> productColors;

  factory ProductOptions.fromJson(Map<String, dynamic> json) => ProductOptions(
        productSizes: List<String>.from(json["productSizes"].map((x) => x)),
        productColors: List<ProductColor>.from(
            json["productColors"].map((x) => ProductColor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productSizes": List<dynamic>.from(productSizes.map((x) => x)),
        "productColors":
            List<dynamic>.from(productColors.map((x) => x.toJson())),
      };
}
//
class ProductColor {
  ProductColor({
    required this.colorImages,
    required this.colorName,
    required this.id,
  });

  final List<String> colorImages;
  final String colorName;
  final String id;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        colorImages: List<String>.from(json["colorImages"].map((x) => x)),
        colorName: json["colorName"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "colorImages": List<dynamic>.from(colorImages.map((x) => x)),
        "colorName": colorName,
        "_id": id,
      };
}
//
class ProductVariants {
  VariantAttributes? variantAttributes;
  String? sId;
  String? variantPrice;
  int? iV;
  String? createdAt;
  String? updatedAt;
  String? productId;

  ProductVariants(
      {this.variantAttributes,
        this.sId,
        this.variantPrice,
        this.iV,
        this.createdAt,
        this.updatedAt,
        this.productId});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    variantAttributes = json['variantAttributes'] != null
        ? new VariantAttributes.fromJson(json['variantAttributes'])
        : null;
    sId = json['_id'];
    variantPrice = json['variantPrice'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.variantAttributes != null) {
      data['variantAttributes'] = this.variantAttributes!.toJson();
    }
    data['_id'] = this.sId;
    data['variantPrice'] = this.variantPrice;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['productId'] = this.productId;
    return data;
  }
}

//
class VariantAttributes {
  VariantAttributes({
    required this.variantColor,
    required this.variantSize,
  });

  final VariantColor? variantColor;
  final String variantSize;

  factory VariantAttributes.fromJson(Map<String, dynamic> json) =>
      VariantAttributes(
        variantColor: json["variantColor"] == null
            ? null
            : VariantColor.fromJson(json["variantColor"]),
        variantSize: json["variantSize"],
      );

  Map<String, dynamic> toJson() => {
        "variantColor": variantColor == null ? null : variantColor!.toJson(),
        "variantSize": variantSize,
      };
}
//
class VariantColor {
  VariantColor({
    required this.colorName,
  });

  final String colorName;

  factory VariantColor.fromJson(Map<String, dynamic> json) => VariantColor(
        colorName: json["colorName"],
      );

  Map<String, dynamic> toJson() => {
        "colorName": colorName,
      };
}
//