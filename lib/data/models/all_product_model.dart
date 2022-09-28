import 'dart:convert';

 AllProductModel allProductModelFromJson(String str) =>
     AllProductModel.fromJson(json.decode(str));


class AllProductModel {
    List<Products>? products;
    String? message;
    int? status;

    AllProductModel({this.products, this.message, this.status});

    AllProductModel.fromJson(Map<String, dynamic> json) {
        if (json['products'] != null) {
            products = <Products>[];
            json['products'].forEach((v) {
                products!.add(Products.fromJson(v));
            });
        }
        message = json['message'];
        status = json['status'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if (products != null) {
            data['products'] = products!.map((v) => v.toJson()).toList();
        }
        data['message'] =message;
        data['status'] = status;
        return data;
    }
}

class Products {
    ProductOptions? productOptions;
    String? sId;
    String? productName;
    List<ProductVariants>? productVariants;
    String? createdAt;
    String? updatedAt;
    int? iV;

    Products(
        {this.productOptions,
            this.sId,
            this.productName,
            this.productVariants,
            this.createdAt,
            this.updatedAt,
            this.iV});

    Products.fromJson(Map<String, dynamic> json) {
        productOptions = json['productOptions'] != null
            ? ProductOptions.fromJson(json['productOptions'])
            : null;
        sId = json['_id'];
        productName = json['productName'];
        if (json['productVariants'] != null) {
            productVariants = <ProductVariants>[];
            json['productVariants'].forEach((v) {
                productVariants!.add( ProductVariants.fromJson(v));
            });
        }
        createdAt = json['createdAt'];
        updatedAt = json['updatedAt'];
        iV = json['__v'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if (productOptions != null) {
            data['productOptions'] = productOptions!.toJson();
        }
        data['_id'] = sId;
        data['productName'] = productName;
        if (productVariants != null) {
            data['productVariants'] =
                productVariants!.map((v) => v.toJson()).toList();
        }
        data['createdAt'] =createdAt;
        data['updatedAt'] = updatedAt;
        data['__v'] = iV;
        return data;
    }
}

class ProductOptions {
    List<String>? productSizes;
    List<ProductColors>? productColors;

    ProductOptions({this.productSizes, this.productColors});

    ProductOptions.fromJson(Map<String, dynamic> json) {
        productSizes = json['productSizes'].cast<String>();
        if (json['productColors'] != null) {
            productColors = <ProductColors>[];
            json['productColors'].forEach((v) {
                productColors!.add( ProductColors.fromJson(v));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['productSizes'] = productSizes;
        if (productColors != null) {
            data['productColors'] =
                productColors!.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class ProductColors {
    List<String>? colorImages;
    String? colorName;
    String? sId;

    ProductColors({this.colorImages, this.colorName, this.sId});

    ProductColors.fromJson(Map<String, dynamic> json) {
        colorImages = json['colorImages'].cast<String>();
        colorName = json['colorName'];
        sId = json['_id'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['colorImages'] =colorImages;
        data['colorName'] = colorName;
        data['_id'] = sId;
        return data;
    }
}

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
            ?  VariantAttributes.fromJson(json['variantAttributes'])
            : null;
        sId = json['_id'];
        variantPrice = json['variantPrice'];
        iV = json['__v'];
        createdAt = json['createdAt'];
        updatedAt = json['updatedAt'];
        productId = json['productId'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if (variantAttributes != null) {
            data['variantAttributes'] = variantAttributes!.toJson();
        }
        data['_id'] =sId;
        data['variantPrice'] = variantPrice;
        data['__v'] = iV;
        data['createdAt'] = createdAt;
        data['updatedAt'] = updatedAt;
        data['productId'] = productId;
        return data;
    }
}

class VariantAttributes {
    VariantColor? variantColor;
    String? variantSize;

    VariantAttributes({this.variantColor, this.variantSize});

    VariantAttributes.fromJson(Map<String, dynamic> json) {
        variantColor = json['variantColor'] != null
            ? VariantColor.fromJson(json['variantColor'])
            : null;
        variantSize = json['variantSize'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if (this.variantColor != null) {
            data['variantColor'] = this.variantColor!.toJson();
        }
        data['variantSize'] = this.variantSize;
        return data;
    }
}

class VariantColor {
    String? colorName;

    VariantColor({this.colorName});

    VariantColor.fromJson(Map<String, dynamic> json) {
        colorName = json['colorName'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['colorName'] = this.colorName;
        return data;
    }
}