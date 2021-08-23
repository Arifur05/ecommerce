import 'package:ecommerce/Models/exclusive_products_model.dart';
import 'package:ecommerce/repositories/exclusive_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exclusiveProductProvider =
    FutureProvider<ExclusiveProductModel>((ref)async => await ExclusiveRepository.getAllExclusiveProducts());