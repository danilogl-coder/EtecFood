import 'package:etecfood/screen/base/drawer/custom_drawer.dart';
import 'package:etecfood/screen/products/components/product_list_tile.dart';
import 'package:etecfood/screen/products/components/search_dialog.dart';
import 'package:etecfood/screen/products/products_controller.dart';
import 'package:etecfood/screen/products/products_cubit.dart';
import 'package:etecfood/screen/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductCubit>(context).loadAllProducts();
  }

  @override
  Widget build(BuildContext context) {
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
                      BlocProvider.of<ProductCubit>(context).setSearch(search);
                      Modular.get<ProductController>().updateSearch(search);
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
                      BlocProvider.of<ProductCubit>(context).setSearch(search);
                      Modular.get<ProductController>().updateSearch(search);
                    }
                  },
                  icon: const Icon(Icons.search));
            } else {
              return IconButton(
                  onPressed: () async {
                    BlocProvider.of<ProductCubit>(context).setSearch(null);
                    Modular.get<ProductController>().updateSearch(null);
                  },
                  icon: const Icon(Icons.close));
            }
          })
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
            final filteredProducts =
                Modular.get<ProductController>().filteredProducts;
            return Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(4.0),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    print(filteredProducts[index]);
                    return ProductListTile(
                      product: filteredProducts[index],
                    );
                  }),
            );
          }),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FloatingActionButton(
                onPressed: () {
                  Modular.to.pushNamed("/CartModule/");
                },
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 17, 17, 37),
                elevation: 0,
                highlightElevation: 0,
                splashColor: const Color.fromARGB(255, 73, 73, 95),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
    );
  }
}
