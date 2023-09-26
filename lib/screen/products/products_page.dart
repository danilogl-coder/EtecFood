import 'package:etecfood/screen/base/drawer/custom_drawer.dart';
import 'package:etecfood/screen/products/components/product_list_tile.dart';
import 'package:etecfood/screen/products/components/search_dialog.dart';
import 'package:etecfood/screen/products/products_cubit.dart';
import 'package:etecfood/screen/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductCubit>(context).loadAllProducts();
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state.search == null) {
              return const Text('Produtos');
            } else {
              return LayoutBuilder(builder: (context, constraint) {
                return GestureDetector(
                  onTap: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(
                              initialText: state.search,
                            ));
                    if (search != null) {
                      // ignore: use_build_context_synchronously
                      context.read<ProductCubit>().setSearch(search);
                    }
                  },
                  child: Container(
                    width: constraint.biggest.width,
                    child: Text(
                      state.search!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              });
            }
          },
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
            if (state.search == null) {
              return IconButton(
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(
                              initialText: state.search,
                            ));
                    if (search != null) {
                      // ignore: use_build_context_synchronously
                      context.read<ProductCubit>().setSearch(search);
                    }
                  },
                  icon: const Icon(Icons.search));
            } else {
              return IconButton(
                  onPressed: () async {
                    context.read<ProductCubit>().setSearch(null);
                  },
                  icon: const Icon(Icons.close));
            }
          })
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        final filteredProducts =
            BlocProvider.of<ProductCubit>(context).filteredProducts;
        return ListView.builder(
            padding: const EdgeInsets.all(4.0),
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              return ProductListTile(
                product: filteredProducts[index],
              );
            });
      }),
    );
  }
}
