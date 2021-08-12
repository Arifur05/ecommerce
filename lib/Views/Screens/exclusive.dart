import 'package:ecommerce/Models/productsmodel.dart';
import 'package:ecommerce/providers/productprovider.dart';
import 'package:ecommerce/server/apimanager.dart';
import 'package:flutter/material.dart';

class ExclusiveProducts extends StatefulWidget{
  const ExclusiveProducts({Key? key}) : super(key: key);

  @override
  _ExclusiveProductsPage createState() =>_ExclusiveProductsPage();

}

class _ExclusiveProductsPage extends State<ExclusiveProducts>{
   final productProvider=ProductProvider();

  @override
  void initState() {

    productProvider.eventSink.add(ProductsAction.fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<Data>>(
          stream: productProvider.productsStream,
          builder: (context, snapshot){
            print(snapshot.connectionState);
                var length = snapshot.data?.length;
                var data = snapshot.data;
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(data == null ? 0 : data.length, (index) {
                    return Card(
                      elevation: 3.0,
                      child: Column(
                        children: [
                          Image.network(data?[index].image,
                              height: 120,
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

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

      ),
    );
  }


}