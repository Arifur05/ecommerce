import 'package:ecommerce/Models/exclusive_products_model.dart';
import 'package:ecommerce/Views/common/grid_delegate.dart';
import 'package:ecommerce/providers/exclusive_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExclusiveProducts extends ConsumerWidget {
  const ExclusiveProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<ExclusiveProductModel> exclusiveProductsData =
        watch(exclusiveProductProvider);
    return Scaffold(
        body: SafeArea(
      child: exclusiveProductsData.when(
        data: (data) => GridView.builder(
            shrinkWrap: true,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              height: 320,
            ),
            itemCount: data.data!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3.0,
                child: Column(
                  children: [
                    Image.network(data.data![index].image,
                        height: 120,
                        width: MediaQuery.of(context).size.width / 4,
                        fit: BoxFit.contain),
                    Text(data.data![index].name),
                    Text(data.data![index].price),
                  ],
                ),
              );
            }),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text(
            error.toString(),
          ),
        ),
      ),
    ));
  }
}
