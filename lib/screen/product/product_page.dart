import 'package:etecfood/screen/base/drawer/custom_drawer.dart';
import 'package:etecfood/screen/product/components/product_list_tile.dart';
import 'package:etecfood/screen/product/product_cubit.dart';
import 'package:etecfood/screen/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).loadAllProducts();
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) => ListView.builder(
            padding: const EdgeInsets.all(4.0),
            itemCount: state.products!.length,
            itemBuilder: (context, index) =>
                ProductListTile(product: state.products![index])),
      ),
    );
  }
}
