import 'dart:async';
import 'dart:convert';

import 'package:ecommerce/Models/product.dart';
import 'package:ecommerce/Models/productsmodel.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_retry/http_retry.dart';

enum PopulerAction { fetch }

class PopularProvider {
  final _stateStreamController = StreamController<List<Product>>();

  StreamSink<List<Product>> get _productsSink => _stateStreamController.sink;

  Stream<List<Product>> get productsStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<PopulerAction>();

  StreamSink<PopulerAction> get eventSink => _eventStreamController.sink;

  Stream<PopulerAction> get _eventStream => _eventStreamController.stream;

  PopularProvider() {
    _eventStream.listen((event) async {
      if (event == PopulerAction.fetch) {
        try {
          var products = await fetchProducts();
          print(products);
          if (products!=null) {
            _productsSink.add(products);
          } else {
            _productsSink.addError('Something went wrong');
          }
        } catch (e) {
          _productsSink.addError('Something went wrong2'+e.toString());
          print(e.toString());
        }
      }
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }

  Future<List<Data>> getProducts() async {
    final client = RetryClient(http.Client());
    var productsModel;

    try {
      var response = await client.get(Uri.parse(Constants.devURl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print('Something' + jsonString);
        var jsonMap = jsonDecode(jsonString);

        productsModel = ProductModel.fromJson(jsonMap);
      }
    } catch(e, stacktrace) {
      print( stacktrace);
    }

    return productsModel;
  }

  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var productsModel;
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      productsModel= jsonString;
      return productFromJson(productsModel);
    } else {
      //show error message
      return productsModel;
    }
  }
}
