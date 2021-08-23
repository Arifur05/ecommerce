import 'dart:convert';

ExclusiveProductModel exclusiveProductFromJson(String str) =>
    ExclusiveProductModel.fromJson(jsonDecode(str));

String exclusiveProductToJson(ExclusiveProductModel data) => json.encode(data.toJson());

class ExclusiveProductModel {
  bool? success;
  List<Data>? data;

  ExclusiveProductModel({this.success, this.data});

  ExclusiveProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic image;
  dynamic sId;
  dynamic name;
  int? cId;
  dynamic brandName;
  dynamic price;
  dynamic discountedPrice;

  Data(
      {this.image,
        this.sId,
        this.name,
        this.cId,
        this.brandName,
        this.price,
        this.discountedPrice});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sId = json['_id'];
    name = json['name'];
    cId = json['c_id'];
    brandName = json['brand_name'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['c_id'] = this.cId;
    data['brand_name'] = this.brandName;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    return data;
  }
}