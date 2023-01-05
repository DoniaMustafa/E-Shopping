// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddProductModel addProductModelFromMap(String str) => AddProductModel.fromMap(json.decode(str));

String addProductModelToMap(AddProductModel data) => json.encode(data.toMap());

class AddProductModel {
    AddProductModel({
        required this.product,
        required this.message,
        required this.status,
    });

    final Product? product;
    final String message;
    final int status;

    factory AddProductModel.fromMap(Map<String, dynamic> json) => AddProductModel(
        product: json["product"] == null ? null : Product.fromMap(json["product"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toMap() => {
        "product": product == null ? null : product!.toMap(),
        "message": message == null ? null : message,
        "status": status == null ? null : status,
    };
}

class Product {
    Product({
        required this.productName,
        required this.productOptions,
        required this.productVariants,
        required this.id,



    });

    final String productName;
    final ProductOptions? productOptions;
    final List<String>? productVariants;
    final String id;




    factory Product.fromMap(Map<String, dynamic> json) => Product(
        productName: json["productName"] == null ? null : json["productName"],
        productOptions: json["productOptions"] == null ? null : ProductOptions.fromMap(json["productOptions"]),
        productVariants: json["productVariants"] == null ? null : List<String>.from(json["productVariants"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],



    );

    Map<String, dynamic> toMap() => {
        "productName": productName == null ? null : productName,
        "productOptions": productOptions == null ? null : productOptions!.toMap(),
        "productVariants": productVariants == null ? null : List<dynamic>.from(productVariants!.map((x) => x)),
        "_id": id == null ? null : id,
    };
}

class ProductOptions {
    ProductOptions({
        required this.productSizes,
        required this.productColors,
    });

    final List<String>? productSizes;
    final List<ProductColor>? productColors;

    factory ProductOptions.fromMap(Map<String, dynamic> json) => ProductOptions(
        productSizes: json["productSizes"] == null ? null : List<String>.from(json["productSizes"].map((x) => x)),
        productColors: json["productColors"] == null ? null : List<ProductColor>.from(json["productColors"].map((x) => ProductColor.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "productSizes": productSizes == null ? null : List<dynamic>.from(productSizes!.map((x) => x)),
        "productColors": productColors == null ? null : List<dynamic>.from(productColors!.map((x) => x.toMap())),
    };
}

class ProductColor {
    ProductColor({
        required this.colorImages,
        required this.colorName,
         this.id,
    });

    final List<String>? colorImages;
    final String colorName;
    final String? id;

    factory ProductColor.fromMap(Map<String, dynamic> json) => ProductColor(
        colorImages: json["colorImages"] == null ? null : List<String>.from(json["colorImages"].map((x) => x)),
        colorName: json["colorName"] == null ? null : json["colorName"],
        id: json["_id"] == null ? null : json["_id"],
    );

    Map<String, dynamic> toMap() => {
        "colorImages": colorImages == null ? null : List<dynamic>.from(colorImages!.map((x) => x)),
        "colorName": colorName == null ? null : colorName,
        "_id": id == null ? null : id,
    };
}

class ProductVariants {
    ProductVariants({
        @required this.productVariants,
    });

    final List<ProductVariant>? productVariants;

    factory ProductVariants.fromMap(Map<String, dynamic> json) => ProductVariants(
        productVariants: json["productVariants"] == null ? null : List<ProductVariant>.from(json["productVariants"].map((x) => ProductVariant.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "productVariants": productVariants == null ? null : List<dynamic>.from(productVariants!.map((x) => x.toMap())),
    };
}

class ProductVariant {
    ProductVariant({
         this.variantAttributes,
         this.id,
        required this.variantPrice,
         this.productId,
    });

    final VariantAttributes? variantAttributes;
    final String? id;
    final String variantPrice;
    final String? productId;

    factory ProductVariant.fromMap(Map<String, dynamic> json) => ProductVariant(
        variantAttributes: json["variantAttributes"] == null ? null : VariantAttributes.fromMap(json["variantAttributes"]),
        id: json["_id"] == null ? null : json["_id"],
        variantPrice: json["variantPrice"] == null ? null : json["variantPrice"],



        productId: json["productId"] == null ? null : json["productId"],
    );

    Map<String, dynamic> toMap() => {
        "variantAttributes": variantAttributes == null ? null : variantAttributes!.toMap(),
        "_id": id == null ? null : id,
        "variantPrice": variantPrice == null ? null : variantPrice,



        "productId": productId == null ? null : productId,
    };
}

class VariantAttributes {
    VariantAttributes({
        this.variantColor,
        this.variantSize,
    });

    final VariantColor? variantColor;
    final String? variantSize;

    factory VariantAttributes.fromMap(Map<String, dynamic> json) => VariantAttributes(
        variantColor: json["variantColor"] == null ? null : VariantColor.fromMap(json["variantColor"]),
        variantSize: json["variantSize"] == null ? null : json["variantSize"],
    );

    Map<String, dynamic> toMap() => {
        "variantColor": variantColor == null ? null : variantColor!.toMap(),
        "variantSize": variantSize == null ? null : variantSize,
    };
}

class VariantColor {
    VariantColor({
        required this.colorName,
    });

    final String colorName;

    factory VariantColor.fromMap(Map<String, dynamic> json) => VariantColor(
        colorName: json["colorName"] == null ? null : json["colorName"],
    );

    Map<String, dynamic> toMap() => {
        "colorName": colorName == null ? null : colorName,
    };
}
