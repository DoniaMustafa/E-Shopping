




import 'dart:convert';


SingleProdModel singleProdModelFromMap(String str) => SingleProdModel.fromMap(json.decode(str));

String singleProdModelToMap(SingleProdModel data) => json.encode(data.toMap());

class SingleProdModel {
  SingleProdModel({
    required this.product,
    required this.message,
    required this.status,
  });

  final Product? product;
  final String message;
  final int status;

  factory SingleProdModel.fromMap(Map<String, dynamic> json) => SingleProdModel(
          product: json["product"] == null ? null : Product.fromMap(json["product"]),
          message: json["message"] == null ? null : json["message"],
          status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
    "product": product!.toMap(),
    "message": message,
    "status": status,
  };
}

class Product {
  Product({
    required this.productOptions,
    required this.id,
    required this.productName,
    required this.productVariants,



  });

  final ProductOptions? productOptions;
  final String id;
  final String productName;
  final List<ProductVariant>? productVariants;




 factory Product.fromMap(Map<String, dynamic> json) => Product(
         productOptions: json["productOptions"] == null ? null : ProductOptions.fromMap(json["productOptions"]),
         id: json["_id"] == null ? null : json["_id"],
         productName: json["productName"] == null ? null : json["productName"]!,
         productVariants: json["productVariants"] == null ? null : List<ProductVariant>.from(json["productVariants"].map((x) => ProductVariant.fromMap(x))),



     );

  Map<String, dynamic> toMap() => {
    "productOptions": productOptions!.toMap(),
    "_id": id,
    "productName": productName,
    "productVariants": List<dynamic>.from(productVariants!.map((x) => x.toMap())),



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
    "productSizes": List<dynamic>.from(productSizes!.map((x) => x)),
    "productColors": List<dynamic>.from(productColors!.map((x) => x.toMap())),
  };
}

class ProductColor {
  ProductColor({
    required this.colorImages,
    required this.colorName,
    required this.id,
  });

  final List<String>? colorImages;
  final String colorName;
  final String id;

      factory ProductColor.fromMap(Map<String, dynamic> json) => ProductColor(
          colorImages: json["colorImages"] == null ? null : List<String>.from(json["colorImages"].map((x) => x)),
          colorName: json["colorName"] == null ? null : json["colorName"],
          id: json["_id"] == null ? null : json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "colorImages": List<dynamic>.from(colorImages!.map((x) => x)),
    "colorName": colorName,
    "_id": id,
  };
}

class ProductVariant {
  ProductVariant({
    required this.variantAttributes,
    required this.id,
    required this.variantPrice,

    required this.productId,
  });

  final VariantAttributes? variantAttributes;
  final String id;
  final String variantPrice;

  final String productId;

  factory ProductVariant.fromMap(Map<String, dynamic> json) => ProductVariant(
    variantAttributes: json["variantAttributes"] == null ? null : VariantAttributes.fromMap(json["variantAttributes"]),
    id: json["_id"] == null ? null : json["_id"],
    variantPrice: json["variantPrice"] == null ? null : json["variantPrice"],

    productId: json["productId"] == null ? null : json["productId"],
  );

  Map<String, dynamic> toMap() => {
    "variantAttributes": variantAttributes!.toMap(),
    "_id": id,
    "variantPrice": variantPrice,

    "productId": productId,
  };
}

class VariantAttributes {
  VariantAttributes({
    required this.variantColor,
    required this.variantSize,
  });

  final VariantColor variantColor;
  final String variantSize;

  factory VariantAttributes.fromMap(Map<String, dynamic> json) => VariantAttributes(
    variantColor: VariantColor.fromMap(json["variantColor"]),
    variantSize: json["variantSize"],
  );

  Map<String, dynamic> toMap() => {
    "variantColor": variantColor.toMap(),
    "variantSize": variantSize,
  };
}

class VariantColor {
  VariantColor({
    required this.colorName,
  });

  final String colorName;

  factory VariantColor.fromMap(Map<String, dynamic> json) => VariantColor(
    colorName: json["colorName"],
  );

  Map<String, dynamic> toMap() => {
    "colorName": colorName,
  };
}
