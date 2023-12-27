// main.dart

import 'package:flutter/material.dart';
import 'package:mvvvvvm/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ProductViewModel(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),

      ),
      body: ViewModelBuilder<ProductViewModel>.reactive(
        viewModelBuilder: () => ProductViewModel(),
        onViewModelReady: (model) => model.fetchProducts(),
        builder: (context, model, child) {
          if (model.isBusy) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: model.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('${model.products[index].thumbnail}'),
                  ),
                  title: Text('${model.products[index]!.title}'),
                  subtitle: Text('\$${model.products[index].price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
