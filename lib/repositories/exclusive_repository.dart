import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/Models/exclusive_products_model.dart';
import 'package:ecommerce/utils/constants.dart';

class ExclusiveRepository{
static Future<dynamic> getAllExclusiveProducts() async{
var response =await Dio().get(exclusiveProductsUrl).timeout(const Duration(seconds: TIME_OUT_DURATION));


if (response.data['success'] == true) {
  print(response);
  return exclusiveProductFromJson(jsonEncode(response.data));
} else {
  print(response.data['message']);
}
}
}