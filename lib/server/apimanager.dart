import 'dart:convert';

import 'package:ecommerce/Models/productsModel.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:http/http.dart' as http;
class APIManager {
  Future<ProductModel> getProducts() async {
    var client = http.Client();
    var productsModel;

    try {
      var response = await client.get(Uri.parse('http://localhost:8080/api/v1/products'));
      if (response.statusCode == 200) {
        print(response.body);
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        productsModel = ProductModel.fromJson(jsonMap);
      }
    } on Exception {
      return productsModel;
    }

    return productsModel;
  }
}