import 'package:elevate_flutter_advanced_bootcamp/Screen/product/bloc/cubit.dart';
import 'package:elevate_flutter_advanced_bootcamp/Screen/product/bloc/states.dart';
import 'package:elevate_flutter_advanced_bootcamp/Screen/product/widget/productitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = 'product';
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Product'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ProductCubit()..fetchProducts(),
        child: BlocConsumer<ProductCubit, ProductStates>(
          builder: (context, state) {
            var cubit = ProductCubit.get(context);
            if (state is ProductGetSourcesLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductGetSourcesErrorState) {
              return Center(child: Text('Error:'));
            } else {
              return GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: cubit.products.length,
                itemBuilder: (context, index) {
                  var product = cubit.products[index];
                  return ProductItem(product: product);
                },
              );
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
