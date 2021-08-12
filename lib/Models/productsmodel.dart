import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(jsonDecode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.success,
    required this.data,
  });

  dynamic success= false;
  List<Data> data =[];

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.image,
    this.id,
    this.name,
    this.cId,
    this.brandName,
    this.price,
    this.discountedPrice,
  });

  dynamic image;
  dynamic id;
  dynamic name;
  dynamic cId;
  dynamic brandName;
  dynamic price;
  dynamic discountedPrice;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        image: json["image"],
        id: json["_id"],
        name: json["name"],
        cId: json["c_id"],
        brandName: json["brand_name"],
        price: json["price"],
        discountedPrice: json["discounted_price"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "_id": id,
        "name": name,
        "c_id": cId,
        "brand_name": brandName,
        "price": price,
        "discounted_price": discountedPrice,
      };
}
