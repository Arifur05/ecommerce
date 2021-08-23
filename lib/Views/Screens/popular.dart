import 'package:ecommerce/Models/product.dart';
import 'package:ecommerce/providers/populerprovider.dart';
import 'package:ecommerce/providers/exclusive_product_provider.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatefulWidget{
  const PopularProducts({Key? key}) : super(key: key);

  @override
  _PopularProductsPage createState() =>_PopularProductsPage();

}

class _PopularProductsPage extends State<PopularProducts>{


  @override
  void initState() {

    /*popularprovider.eventSink.add(PopulerAction.fetch);*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Product>>(
          //stream: popularprovider.productsStream,
          builder: (context, snapshot){
            print(snapshot.connectionState);

            var length = snapshot.data?.length;
            var data = snapshot.data;
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(length?? 0, (index) {
                return Card(
                  elevation: 3.0,
                  child: Column(
                    children: [

                      Image.network(data?[index].imageLink,
                          height: 100,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 4,
                          fit: BoxFit.contain),
                      Text(snapshot.data?[index].name),
                      Text(snapshot.data?[index].price),
                    ],
                  ),
                );
              }
              ),
            );

          },
        ),

      ),
    );
  }


}